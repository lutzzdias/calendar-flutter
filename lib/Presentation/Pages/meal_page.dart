import 'package:calendar/Domain/Models/food.dart';
import 'package:calendar/Domain/Models/meal.dart';
import 'package:calendar/Presentation/Widgets/MealPage/food_button.dart';
import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  final String mealType;
  final DateTime date;
  const MealPage({Key? key, required this.mealType, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealType),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text("${date.day}/${date.month}/${date.year}"),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                Food food = Food(description: "test $index", icon: "adb");
                return FoodButton(food: food);
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  )),
              onPressed: () {
                Meal(
                  mealType: mealType,
                  date: date,
                );
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
