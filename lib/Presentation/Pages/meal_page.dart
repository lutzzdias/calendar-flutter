import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';
import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Widgets/MealPage/food_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealPage extends StatefulWidget {
  final String mealType;
  final DateTime date;
  final Function()? onPressed;

  const MealPage(
      {Key? key,
      required this.mealType,
      required this.date,
      required this.onPressed})
      : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Food> selected = List.empty(growable: true);
  List<Food> foods = [
    Food(icon: '0xe037', description: 'floco de neve'),
    Food(icon: '0xee30', description: 'cadeirante veloz'),
    Food(icon: '0xe06e', description: 'avião'),
    Food(icon: '0xe07e', description: 'infinito'),
    Food(icon: '0xe084', description: 'âncora'),
    Food(icon: '0xf04be', description: 'apple'),
    Food(icon: '0xe090', description: 'compasso'),
    Food(icon: '0xe0b2', description: 'money'),
  ];

  @override
  Widget build(BuildContext context) {
    MealController mealController = Provider.of<MealController>(context);
    Function()? onPressed = widget.onPressed;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text("${widget.date.day}/${widget.date.month}/${widget.date.year}"),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return FoodButton(
                  food: foods[index],
                  isToggled: (bool value) {
                    setState(() {
                      if (value) {
                        selected.add(foods[index]);
                      } else {
                        selected.remove(foods[index]);
                      }
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  )),
              onPressed: () {
                Meal meal = Meal(
                  date: widget.date,
                  mealType: widget.mealType,
                );
                for (Food food in selected) {
                  meal.foods.add(food);
                }
                MealResponseDTO response =
                    mealController.createMeal(CreateMealDTO.fromMeal(meal));
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
