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
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: 50,
        height: 50,
        child: Center(
            child: Text(
          "${date.day}/${date.month}",
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
