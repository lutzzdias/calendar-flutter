import 'package:calendar/Domain/Models/meal.dart';

class MealDTO {
  int id;
  DateTime date;
  String mealType;
  List<String> foodsIds;

  MealDTO({
    this.id = 0,
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);

  MealDTO.fromMeal(Meal meal)
      : id = meal.id,
        date = meal.date,
        mealType = meal.mealType,
        foodsIds = meal.foodsIds;

  Meal toMeal() {
    return Meal(
      id: id,
      date: date,
      mealType: mealType,
      foodsIds: foodsIds,
    );
  }
}
