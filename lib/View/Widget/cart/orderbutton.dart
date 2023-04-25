import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CustomCartButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomCartButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        // animationDuration: Duration(milliseconds: 10),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.standard,
        color: AppColor.primaryColor,
        textColor: AppColor.whiteColor,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.greyColor),
        ),
      ),
    );
  }
}
