import 'package:calendar/Domain/Enums/meal_type_enum.dart';
import 'package:calendar/Domain/Models/day.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Meal {
  int id;
  DateTime date;
  String mealType;
  List<String> foodsIds;
  final day = ToOne<Day>();

  Meal({
    this.id = 0,
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);
}
