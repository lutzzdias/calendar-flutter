import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';

class CreateMealDTO {
  DateTime date;
  String mealType;
  List<Food>? foods;

  CreateMealDTO({
    required this.date,
    required this.mealType,
    List<Food>? foods,
  });

  CreateMealDTO.fromMeal(Meal meal)
      : date = meal.date,
        mealType = meal.mealType,
        foods = meal.foods;

  Meal toMeal() {
    return Meal(date: date, mealType: mealType, foods: foods);
  }
}
