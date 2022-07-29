import 'package:calendar/Data/Repositories/meal_repository.dart';
import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealService {
  // TODO: Implement Dependency Injection
  final MealRepository _mealRepository = MealRepository();

  MealResponseDTO createMeal(CreateMealDTO createMealDTO) {
    Meal meal = createMealDTO.toMeal();

    // TODO: Add validation

    // TODO: Define how to know which statusCode to return
    _mealRepository.createMeal(meal);
    return MealResponseDTO(statusCode: 201, meal: meal);
  }

  MealDTO? getMealById(String id) {
    Meal? meal = _mealRepository.getMealById(id);

    if (meal != null) {
      return MealDTO.fromMeal(meal);
    } else {
      return null;
    }
  }

  MealResponseDTO updateMeal(MealDTO mealDTO) {
    MealDTO? mealInDatabase = getMealById(mealDTO.id!);

    if (mealInDatabase == null) {
      var response =
          MealResponseDTO(statusCode: 404, errors: ["Meal not found"]);
      return response;
    }

    Meal meal = mealDTO.toMeal();

    // TODO: Add validation

    // TODO: Define how to know which statusCode to return
    _mealRepository.updateMeal(meal);
    return MealResponseDTO(statusCode: 200, meal: meal);
  }

  MealResponseDTO deleteMeal(String id) {
    bool isMealInDatabase = getMealById(id) != null;

    if (isMealInDatabase) {
      _mealRepository.deleteMeal(id);
      return MealResponseDTO(statusCode: 200);
    } else {
      return MealResponseDTO(statusCode: 404, errors: ["Meal not Found"]);
    }
  }
}