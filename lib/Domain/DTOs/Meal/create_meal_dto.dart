import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/meal.dart';

class CreateMealDTO {
  DateTime date;
  String mealType;
  List<String> foodsIds;

  CreateMealDTO({
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);

  CreateMealDTO.fromMeal(Meal meal)
      : this.date = meal.date,
        this.mealType = meal.mealType,
        this.foodsIds = meal.foodsIds;

  Meal toMeal() {
    return Meal(date: date, mealType: mealType, foodsIds: foodsIds);
  }
}
