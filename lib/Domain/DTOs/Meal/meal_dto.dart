import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealDTO {
  int id;
  DateTime date;
  String mealType;
  List<Food>? foods;

  MealDTO(
      {this.id = 0, required this.date, required this.mealType, this.foods});

  MealDTO.fromMeal(Meal meal)
      : id = meal.id,
        date = meal.date,
        mealType = meal.mealType,
        foods = meal.foods;

  Meal toMeal() {
    return Meal(
      id: id,
      date: date,
      mealType: mealType,
      foods: foods,
    );
  }
}
