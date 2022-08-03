import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:flutter/cupertino.dart';

class MealRepository with ChangeNotifier {
  ObjectBox database;

  MealRepository(this.database);

  int createMeal(Meal meal) {
    // TODO: Implement Create operation in database
    database.mealBox.put(meal);
    return meal.id;
  }

  Meal? getMealById(int id) {
    // TODO: Implement GetById operation in database
    return database.mealBox.get(id);
  }

  // TODO: Implement GetAll

  void updateMeal(Meal meal) {
    // TODO: Implement Update operation in database
  }

  void deleteMeal(int id) {
    // TODO: Implement Delete operation in database
  }
}
