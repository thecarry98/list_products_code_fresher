import 'package:flutter/material.dart';

class titleAppBar extends StatelessWidget {
  final String title;
  const titleAppBar({super.key, required this.title});

  Widget build(BuildContext context) {
    return Text(
      this.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
