import 'package:calendar/Domain/Models/food.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Meal {
  @Id()
  int id;
  DateTime date;
  String mealType;
  ToMany<Food> foods = ToMany<Food>();

  Meal({
    this.id = 0,
    required this.date,
    required this.mealType,
    List<Food>? foods,
  }) {
    if (foods != null) this.foods.addAll(foods);
  }
}
