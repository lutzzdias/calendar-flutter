import 'package:calendar/Presentation/Pages/calendar_page.dart';
import 'package:calendar/Presentation/Pages/test_page.dart';
import 'package:calendar/Presentation/Widgets/HomePage/home_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeButton(title: "Nutrição", nextScreen: CalendarPage()),
            const HomeButton(
                title: "Psicologia", nextScreen: TestPage(title: "Psicologia")),
            const HomeButton(
                title: "Sono", nextScreen: TestPage(title: "Sono")),
            const HomeButton(
                title: "Medicina", nextScreen: TestPage(title: "Medicina")),
            const HomeButton(
                title: "Jogo do Bicho",
                nextScreen: TestPage(title: "Vencedor: Cabra"))
          ],
        ),
      ),
    );
  }
}
