import 'package:flutter/material.dart';

class MealButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final DateTime date;
  final String mealType;

  const MealButton(
      {Key? key,
      required this.title,
      required this.icon,
      required this.date,
      required this.mealType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(75)),
      onPressed: () => null,
      icon: icon,
      label: Text(title),
    );
  }
}
