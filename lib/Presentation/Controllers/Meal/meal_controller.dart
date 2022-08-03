import 'package:calendar/Application/Services/meal_service.dart';
import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';

class MealController {
  // TODO: Implement Dependency Injection
  static final MealService _mealService = MealService();

  static MealResponseDTO createMeal(CreateMealDTO createMealDTO) {
    return _mealService.createMeal(createMealDTO);
  }

  static MealDTO? getMealById(int id) {
    return _mealService.getMealById(id);
  }

  static MealResponseDTO updateMeal(MealDTO mealDTO) {
    return _mealService.updateMeal(mealDTO);
  }

  static MealResponseDTO deleteMeal(int id) {
    return _mealService.deleteMeal(id);
  }
}
