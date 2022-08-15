import 'package:calendar/Domain/Models/food.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Meal {
  @Id()
  int id;
  DateTime date;
  String mealType;
  final ToMany<Food> foods = ToMany<Food>();

  Meal({
    this.id = 0,
    required this.date,
    required this.mealType,
  });
}
