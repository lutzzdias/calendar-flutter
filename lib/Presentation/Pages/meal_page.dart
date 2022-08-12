import 'package:calendar/Domain/Models/food.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${date.day}/${date.month}/${date.year}"),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  Food food = Food(description: "teste $index", icon: "adb");
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.adb),
                        Text(food.description),
                      ],
                    ),
                  );
                },
              ),
            ),
            TextButton(onPressed: () => null, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
