import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/food.dart';

class Meal {
  String id;
  DateTime date;
  MealType mealType;
  List<Food> foods = List.empty(growable: true);

  Meal({
    required this.id,
    required this.date,
    required this.mealType,
    Food? food,
  }) {
    if (food != null) foods.add(food);
  }
}
