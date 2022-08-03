import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Widgets/DayPage/meal_button.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  final DateTime date;

  const DayPage({Key? key, required this.date}) : super(key: key);

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  List<Meal> meals = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(height: 10),
          MealButton(
            title: "Almoço",
            icon: const Icon(Icons.lunch_dining),
            date: widget.date,
            mealType: "lunch",
          ),
          const SizedBox(height: 10),
          MealButton(
            title: "Jantar",
            icon: const Icon(Icons.dinner_dining),
            date: widget.date,
            mealType: "dinner",
          ),
          const SizedBox(height: 10),
          MealButton(
            title: "Lanche",
            icon: const Icon(Icons.fastfood),
            date: widget.date,
            mealType: "snack",
          ),
        ],
      ),
    );
  }
}
