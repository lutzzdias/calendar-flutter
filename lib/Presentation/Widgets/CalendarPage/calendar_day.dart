import 'package:calendar/Presentation/Pages/day_page.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final int index;

  const CalendarDay({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DayPage(day: index + 1))),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
        ),
        width: 50,
        height: 50,
        child: Center(child: Text("${index + 1}")),
      ),
    );
  }
}
