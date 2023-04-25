import 'package:flutter/material.dart';

import '../../../Core/Constant/color.dart';

class CustomTextHome extends StatelessWidget {
  final String text;
  const CustomTextHome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: const TextStyle(
              color: AppColor.greyColor,
              fontWeight: FontWeight.bold,
              fontSize: 14)),
    );
  }
}
