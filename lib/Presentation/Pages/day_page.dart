import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Widgets/DayPage/meal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayPage extends StatefulWidget {
  final DateTime date;

  const DayPage({Key? key, required this.date}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  @override
  Widget build(BuildContext context) {
    final mealController = Provider.of<MealController>(context);
    List<MealDTO> breakfast = mealController
        .getAllMeals()
        .where((element) => element.mealType == "breakfast")
        .where(
          (element) => element.date == widget.date,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.date.day}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MealButton(
            title: "Café da manhã",
            icon: const Icon(Icons.breakfast_dining),
            date: widget.date,
            mealType: "breakfast",
            mealController: mealController,
          ),
          showMeal(context, breakfast, mealController),
          MealButton(
            title: "Almoço",
            icon: const Icon(Icons.lunch_dining),
            date: widget.date,
            mealType: "lunch",
            mealController: mealController,
          ),
          const SizedBox(height: 10),
          MealButton(
            title: "Jantar",
            icon: const Icon(Icons.dinner_dining),
            date: widget.date,
            mealType: "dinner",
            mealController: mealController,
          ),
          const SizedBox(height: 10),
          MealButton(
            title: "Lanche",
            icon: const Icon(Icons.fastfood),
            date: widget.date,
            mealType: "snack",
            mealController: mealController,
          ),
        ],
      ),
    );
  }

  Widget showMeal(BuildContext context, List<MealDTO> breakfast,
      MealController mealController) {
    return breakfast.isNotEmpty
        ? Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(breakfast.first.id.toString()),
                    Text(breakfast.first.mealType),
                    Text(breakfast.first.date.toString()),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => setState(
                      () => mealController.deleteMeal(breakfast.first.id)),
                )
              ],
            ),
          )
        : const SizedBox(height: 10);
  }
}
