import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  final String textbody;
  const CustomTextBody({super.key, required this.textbody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        textbody,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
