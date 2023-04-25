import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CardOrderType extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final void Function() onTap;
  const CardOrderType(
      {super.key,
      required this.image,
      required this.title,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isActive ? AppColor.primaryColor : AppColor.whiteColor,
            border: Border.all(color: AppColor.skyColor)),
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Spacer(),
            Text(title)
          ],
        ),
      ),
    );
  }
}
