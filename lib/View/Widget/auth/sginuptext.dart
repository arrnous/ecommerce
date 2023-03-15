import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUporIn extends StatelessWidget {
  final String account;
  final String text;
  final void Function() onTap;
  const CustomTextSignUporIn(
      {super.key,
      required this.account,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(account),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
                color: AppColor.skyColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
