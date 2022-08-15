import 'package:calendar/Presentation/Controllers/Meal/meal_controller.dart';
import 'package:calendar/Presentation/Pages/day_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;

  const CalendarDay({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealController mealController = Provider.of<MealController>(context);
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DayPage(date: date))),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isEmpty(mealController) ? Colors.white : Colors.blue,
        ),
        width: 50,
        height: 50,
        child: Center(
            child: Text(
          "${date.day}/${date.month}",
          style: TextStyle(
            color: isEmpty(mealController) ? Colors.black : Colors.white,
          ),
        )),
      ),
    );
  }

  bool isEmpty(MealController mealController) {
    if (mealController.getAllMeals().where((x) => x.date == date).isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
