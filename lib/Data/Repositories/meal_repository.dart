import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealRepository {
  void createMeal() {
    // TODO: Implement Create operation in database
  }

  Meal getMealById(String id) {
    // TODO: Implement GetById operation in database
    return Meal(id: 'null', date: DateTime.now(), mealType: MealType.snack);
  }

  // TODO: Implement GetAll

  void updateMeal() {
    // TODO: Implement Update operation in database
  }

  void deleteMeal() {
    // TODO: Implement Delete operation in database
  }
}
