import 'package:calendar/Domain/Models/meal.dart';

class MealRepository {
  void createMeal(Meal meal) {
    // TODO: Implement Create operation in database
  }

  Meal getMealById(int id) {
    // TODO: Implement GetById operation in database
    return Meal(date: DateTime.now(), mealType: "snack");
  }

  // TODO: Implement GetAll

  void updateMeal(Meal meal) {
    // TODO: Implement Update operation in database
  }

  void deleteMeal(int id) {
    // TODO: Implement Delete operation in database
  }
}
