import 'package:calendar/Presentation/Widgets/CalendarPage/calendar_day.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

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
                itemCount: 31,
                itemBuilder: (context, index) {
                  return CalendarDay(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
