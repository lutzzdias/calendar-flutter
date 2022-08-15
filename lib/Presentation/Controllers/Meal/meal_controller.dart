import 'package:calendar/Application/Services/meal_service.dart';
import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class MealController with ChangeNotifier {
  // TODO: Implement Dependency Injection
  final MealService _mealService;
  ObjectBox database;

  MealController(this.database) : _mealService = MealService(database);

  MealResponseDTO createMeal(CreateMealDTO createMealDTO) {
    return _mealService.createMeal(createMealDTO);
  }

  MealDTO? getMealById(int id) {
    return _mealService.getMealById(id);
  }

  MealDTO? getMealByMealTypeAndDate(String mealType, DateTime date) {
    return getAllMeals().firstWhereOrNull(
        (element) => element.mealType == mealType && element.date == date);
  }

  List<MealDTO> getAllMeals() {
    return _mealService.getAllMeals();
  }

  MealResponseDTO updateMeal(MealDTO mealDTO) {
    return _mealService.updateMeal(mealDTO);
  }

  MealResponseDTO deleteMeal(int id) {
    return _mealService.deleteMeal(id);
  }
}
