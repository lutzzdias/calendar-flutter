import 'package:calendar/Domain/Enums/meal_type_enum.dart';

class MealDTO {
  String id;
  DateTime date;
  MealType mealType;
  List<String> foodsIds;

  MealDTO({
    required this.id,
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);
}
