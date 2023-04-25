import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  final void Function() onTap;
  const CardAddress(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isActive ? AppColor.primaryColor : AppColor.silver,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(title),
          subtitle: Text(body),
        ),
      ),
    );
  }
}
