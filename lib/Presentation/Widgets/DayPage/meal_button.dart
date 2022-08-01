import 'package:flutter/material.dart';

class MealButton extends StatelessWidget {
  final String title;
  final Icon icon;
  const MealButton({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(75)),
      onPressed: () => print("hey"),
      icon: icon,
      label: Text(title),
    );
  }
}
