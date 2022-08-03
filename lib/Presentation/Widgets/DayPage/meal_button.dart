import 'package:calendar/Domain/Models/day.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:flutter/material.dart';

class MealButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final Day day;
  final String mealType;

  const MealButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.day,
      required this.mealType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(75)),
      onPressed: () => day.addMeal(Meal(date: day.date!, mealType: mealType)),
      icon: icon,
      label: Text(title),
    );
  }
}
