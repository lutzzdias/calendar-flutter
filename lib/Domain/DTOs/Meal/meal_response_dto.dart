import 'package:calendar/Domain/DTOs/response_dto.dart';
import 'package:calendar/Domain/Models/meal.dart';

class MealResponseDTO extends ResponseDTO {
  Meal? meal;

  MealResponseDTO({required super.statusCode, super.errors, this.meal});
}
