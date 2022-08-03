import 'package:calendar/Presentation/Pages/day_page.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;

  const CalendarDay({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DayPage(date: date))),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        width: 50,
        height: 50,
        child: Center(child: Text("${date.day}/${date.month}")),
      ),
    );
  }
}
