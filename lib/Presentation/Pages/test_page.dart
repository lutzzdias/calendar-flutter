import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String title;
  const TestPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
