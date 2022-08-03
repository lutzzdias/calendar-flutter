import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:objectbox/objectbox.dart';

class CreateMealDTO {
  DateTime date;
  String mealType;
  ToMany<Food>? foods;

  CreateMealDTO({
    required this.date,
    required this.mealType,
    ToMany<Food>? foods,
  });

  CreateMealDTO.fromMeal(Meal meal)
      : date = meal.date,
        mealType = meal.mealType,
        foods = meal.foods;

  Meal toMeal() {
    return Meal(date: date, mealType: mealType);
  }
}
