import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 10 / 10,
          ),
          itemCount: 31,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              child: Text("${index + 1}"),
            );
          },
        ),
      ),
    );
  }
}
