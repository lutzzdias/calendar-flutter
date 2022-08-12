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
          children: [
            Text("${date.day}/${date.month}/${date.year}"),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Icon(Icons.add)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
