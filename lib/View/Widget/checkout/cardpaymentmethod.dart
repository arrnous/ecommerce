import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function() onTap;
  const CardPaymentMethod(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: isActive ? AppColor.whiteColor : AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? AppColor.greyColor : AppColor.whiteColor),
        ),
      ),
    );
  }
}
