import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/meal.dart';

class CreateMealDTO {
  DateTime date;
  MealType mealType;
  List<String> foodsIds;

  CreateMealDTO({
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);

  Meal toMeal() {
    return Meal(date: date, mealType: mealType, foodsIds: foodsIds);
  }
}
