import 'package:calendar/Domain/Models/meal.dart';
import 'package:flutter/material.dart';

class Day extends ChangeNotifier {
  DateTime? date;
  List<Meal> meals;

  Day({this.date, meals}) : meals = meals ?? List.empty(growable: true);

  void addMeal(Meal meal) {
    meals.add(meal);
    notifyListeners();
  }
}
