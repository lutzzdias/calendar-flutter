import 'package:flutter/material.dart';

class DayPage extends StatelessWidget {
  final int day;
  const DayPage({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$day"),
      ),
      body: Center(child: Text("$day")),
    );
  }
}
