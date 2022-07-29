import 'package:calendar/Domain/Enums/meal_type_enum.dart';

class CreateMealDTO {
  DateTime date;
  MealType mealType;
  List<String> foodsIds;

  CreateMealDTO({
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);
}
