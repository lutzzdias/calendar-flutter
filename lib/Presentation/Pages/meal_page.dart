import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Widgets/MealPage/food_button.dart';
import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  final String mealType;
  final DateTime date;

  MealPage({Key? key, required this.mealType, required this.date})
      : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<int> selected = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
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
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                Food food = Food(description: "test $index", icon: "adb");
                return FoodButton(
                  food: food,
                  isToggled: (bool value) {
                    setState(() {
                      if (value) {
                        selected.add(index);
                      } else {
                        selected.remove(index);
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
                  mealType: widget.mealType,
                  date: widget.date,
                );
                meal.foods.add(Food(description: 'teste', icon: 'adb'));
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
