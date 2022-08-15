import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:flutter/cupertino.dart';

class MealRepository with ChangeNotifier {
  ObjectBox database;

  MealRepository(this.database);

  int createOrUpdateMeal(Meal meal) {
    database.mealBox.put(meal);
    return meal.id;
  }

  Meal? getMealById(int id) {
    return database.mealBox.get(id);
  }

  List<Meal> getAllMeals() {
    return database.mealBox.getAll();
  }

  bool deleteMeal(int id) {
    return database.mealBox.remove(id);
  }
}
