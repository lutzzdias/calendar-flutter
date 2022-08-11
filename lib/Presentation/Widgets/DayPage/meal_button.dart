import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:flutter/material.dart';

class MealButton extends StatefulWidget {
  final String title;
  final Icon icon;
  final DateTime date;
  final String mealType;
  final MealController mealController;

  const MealButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.date,
    required this.mealType,
    required this.mealController,
  }) : super(key: key);

  @override
  State<MealButton> createState() => _MealButtonState();
}

class _MealButtonState extends State<MealButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(75),
          backgroundColor: Colors.blue,
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () => widget.mealController.createMeal(
          CreateMealDTO(date: widget.date, mealType: widget.mealType)),
      icon: widget.icon,
      label: Text(
        widget.title,
      ),
    );
  }
}
