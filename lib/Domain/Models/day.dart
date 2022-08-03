import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

// TODO: Remove this class laterrrrr
@Entity()
class Day extends ChangeNotifier {
  @Id()
  int id;
  DateTime? date;

  @Backlink()
  final meals = ToMany<Meal>();

  Day({this.date, meals, this.id = 0});

  void addMeal(Meal meal) {
    MealController.createMeal(CreateMealDTO.fromMeal(meal));
  }
}
