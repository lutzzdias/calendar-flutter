import 'package:calendar/Domain/Models/meal.dart';

class Day {
  DateTime date;
  List<Meal> meals;

  Day({required this.date, meals})
      : meals = meals ?? List.empty(growable: true);
}
