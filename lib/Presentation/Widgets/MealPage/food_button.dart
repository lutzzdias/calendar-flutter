import 'package:calendar/Domain/Models/food.dart';
import 'package:flutter/material.dart';

class FoodButton extends StatefulWidget {
  final Food food;

  const FoodButton({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodButton> createState() => _FoodButtonState();
}

class _FoodButtonState extends State<FoodButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isToggled ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.adb,
              color: isToggled ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 7),
            Text(
              widget.food.description,
              style: TextStyle(
                color: isToggled ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
