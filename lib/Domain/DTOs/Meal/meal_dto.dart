import 'package:calendar/Domain/Models/meal.dart';

class MealDTO {
  int id;
  DateTime date;
  String mealType;

  MealDTO({
    this.id = 0,
    required this.date,
    required this.mealType,
  });

  MealDTO.fromMeal(Meal meal)
      : id = meal.id,
        date = meal.date,
        mealType = meal.mealType;

  Meal toMeal() {
    return Meal(
      id: id,
      date: date,
      mealType: mealType,
    );
  }
}
