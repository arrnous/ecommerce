import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String textTitle;
  const CustomTitle({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}
