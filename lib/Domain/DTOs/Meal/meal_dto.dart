import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealDTO {
  String? id;
  DateTime date;
  MealType mealType;
  List<String> foodsIds;

  MealDTO({
    this.id,
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);

  MealDTO.fromMeal(Meal meal)
      : id = meal.id,
        date = meal.date,
        mealType = meal.mealType,
        foodsIds = meal.foodsIds;
}
