import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealButton extends StatelessWidget {
  late final MealController _mealController;
  final String title;
  final Icon icon;
  final DateTime date;
  final String mealType;

  MealButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.date,
      required this.mealType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mealController = Provider.of<MealController>(context);
    return TextButton.icon(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(75)),
      onPressed: () {
        final mealInDb = _mealController
            .createMeal(CreateMealDTO(date: date, mealType: mealType));
        print(_mealController.getMealById(mealInDb.meal!.id)!.id);
      },
      icon: icon,
      label: Text(title),
    );
  }
}
