import 'package:objectbox/objectbox.dart';

@Entity()
class Meal {
  int id;
  DateTime date;
  String mealType;
  List<String> foodsIds;

  Meal({
    this.id = 0,
    required this.date,
    required this.mealType,
    List<String>? foodsIds,
  }) : foodsIds = foodsIds ?? List.empty(growable: true);
}
