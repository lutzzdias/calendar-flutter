import 'package:calendar/Domain/Models/day.dart';
import 'package:calendar/Presentation/Pages/day_page.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final Day day;

  const CalendarDay({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DayPage(day: day))),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        width: 50,
        height: 50,
        child: Center(child: Text("${day.date!.day}/${day.date!.month}")),
      ),
    );
  }
}
