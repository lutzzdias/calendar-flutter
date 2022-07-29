import 'package:calendar/Presentation/Widgets/CalendarPage/calendar_day.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 10 / 10,
          ),
          itemCount: 31,
          itemBuilder: (context, index) {
            return CalendarDay(index: index);
          },
        ),
      ),
    );
  }
}
