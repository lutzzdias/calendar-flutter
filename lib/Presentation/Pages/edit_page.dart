import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  final Meal meal;
  const EditPage({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController mealTypeController =
        TextEditingController(text: meal.mealType);
    MealController mealController = Provider.of<MealController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(
        children: [
          const Text("MealType"),
          TextField(
            controller: mealTypeController,
            decoration: const InputDecoration(hintText: "MealType"),
          ),
          TextButton(
            onPressed: () {
              meal.mealType = mealTypeController.text;
              mealController.updateMeal(MealDTO.fromMeal(meal));
              Navigator.pop(context);
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }
}
