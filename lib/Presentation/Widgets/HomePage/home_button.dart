import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final Widget nextScreen;
  const HomeButton({Key? key, required this.title, required this.nextScreen})
      : super(key: key);

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
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextScreen)),
      ),
    );
  }
}
