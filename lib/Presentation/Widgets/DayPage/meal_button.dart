import 'package:flutter/material.dart';

class MealButton extends StatefulWidget {
  final String title;
  final Icon icon;
  final Function()? onPressed;

  const MealButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.onPressed,
      icon: widget.icon,
      label: Text(
        widget.title,
      ),
    );
  }
}
