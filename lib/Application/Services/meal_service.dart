import 'package:calendar/Data/Database/objectbox.dart';
import 'package:calendar/Data/Repositories/meal_repository.dart';
import 'package:calendar/Domain/DTOs/Meal/create_meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_dto.dart';
import 'package:calendar/Domain/DTOs/Meal/meal_response_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealService {
  // TODO: Implement Dependency Injection
  final MealRepository _mealRepository;
  ObjectBox database;

  MealService(this.database) : _mealRepository = MealRepository(database);

  MealResponseDTO createMeal(CreateMealDTO createMealDTO) {
    Meal meal = createMealDTO.toMeal();

    // TODO: Add validation

    // TODO: Define how to know which statusCode to return
    meal.id = _mealRepository.createOrUpdateMeal(meal);
    return MealResponseDTO(statusCode: 201, meal: meal);
  }

  MealDTO? getMealById(int id) {
    Meal? meal = _mealRepository.getMealById(id);

    if (meal != null) {
      return MealDTO.fromMeal(meal);
    } else {
      return null;
    }
  }

  List<MealDTO> getAllMeals() {
    final mealEntities = _mealRepository.getAllMeals();
    final mealDTOs = List<MealDTO>.empty(growable: true);
    mealEntities.forEach(
      (element) {
        mealDTOs.add(MealDTO.fromMeal(element));
      },
    );
    return mealDTOs;
  }

  MealResponseDTO updateMeal(MealDTO mealDTO) {
    MealDTO? mealInDatabase = getMealById(mealDTO.id);

    if (mealInDatabase == null) {
      var response =
          MealResponseDTO(statusCode: 404, errors: ["Meal not found"]);
      return response;
    }

    Meal meal = mealDTO.toMeal();

    // TODO: Add validation

    // TODO: Define how to know which statusCode to return
    _mealRepository.createOrUpdateMeal(meal);
    return MealResponseDTO(statusCode: 200, meal: meal);
  }

  MealResponseDTO deleteMeal(int id) {
    bool isMealInDatabase = getMealById(id) != null;

    if (isMealInDatabase) {
      _mealRepository.deleteMeal(id);
      return MealResponseDTO(statusCode: 200);
    } else {
      return MealResponseDTO(statusCode: 404, errors: ["Meal not Found"]);
    }
  }
}
