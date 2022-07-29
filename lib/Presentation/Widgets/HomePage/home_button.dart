import 'package:calendar/Presentation/Pages/calendar_page.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints.expand(height: 100),
      child: TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(100),
            alignment: Alignment.centerLeft),
        child: const Text(
          "Calendário",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CalendarPage())),
      ),
    );
  }
}
