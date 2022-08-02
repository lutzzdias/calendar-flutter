import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/day.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Widgets/DayPage/meal_button.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  final Day day;

  const DayPage({Key? key, required this.day}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Meal> meals = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.day.date!.day}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MealButton(
            title: "Café da manhã",
            icon: Icon(Icons.breakfast_dining),
            day: widget.day,
            mealType: MealType.breakfast,
          ),
          SizedBox(height: 10),
          MealButton(
            title: "Almoço",
            icon: Icon(Icons.lunch_dining),
            day: widget.day,
            mealType: MealType.lunch,
          ),
          SizedBox(height: 10),
          MealButton(
            title: "Jantar",
            icon: Icon(Icons.dinner_dining),
            day: widget.day,
            mealType: MealType.dinner,
          ),
          SizedBox(height: 10),
          MealButton(
            title: "Lanche",
            icon: Icon(Icons.fastfood),
            day: widget.day,
            mealType: MealType.snack,
          ),
        ],
      ),
    );
  }
}
