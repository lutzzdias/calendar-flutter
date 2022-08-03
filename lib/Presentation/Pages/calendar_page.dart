import 'package:calendar/Presentation/Widgets/CalendarPage/calendar_day.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);
  final DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendário")),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 10 / 10,
                ),
                itemCount:
                    DateTime(currentDate.year, currentDate.month + 1, 0).day,
                itemBuilder: (context, index) {
                  return CalendarDay(
                    date: DateTime(
                        currentDate.year, currentDate.month, index + 1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
