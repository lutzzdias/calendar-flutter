import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:flutter/cupertino.dart';

class MealRepository with ChangeNotifier {
  ObjectBox database;

  MealRepository(this.database);

  int createMeal(Meal meal) {
    database.mealBox.put(meal);
    return meal.id;
  }

  Meal? getMealById(int id) {
    return database.mealBox.get(id);
  }

  List<Meal> getAllMeals() {
    return database.mealBox.getAll();
  }

  void updateMeal(Meal meal) {
    // TODO: Implement Update operation in database
  }

  void deleteMeal(int id) {
    // TODO: Implement Delete operation in database
  }
}
