import 'package:calendar/Application/Services/meal_service.dart';
import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';

class MealController {
  // TODO: Implement Dependency Injection
  final MealService _mealService = MealService();

  MealResponseDTO createMeal(CreateMealDTO createMealDTO) {
    return _mealService.createMeal(createMealDTO);
  }

  MealDTO? getMealById(String id) {
    return _mealService.getMealById(id);
  }

  MealResponseDTO updateMeal(MealDTO mealDTO) {
    return _mealService.updateMeal(mealDTO);
  }

  MealResponseDTO deleteMeal(String id) {
    return _mealService.deleteMeal(id);
  }
}
