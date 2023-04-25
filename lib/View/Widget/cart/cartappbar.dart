import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';

class CartAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final String count;
  @override
  // Size get preferredSize => const Size.fromHeight(50);
  const CartAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      iconTheme: const IconThemeData(color: AppColor.greyColor),
      actions: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                count,
                style: const TextStyle(color: AppColor.greyColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Icon(icon),
            ),
          ],
        )
      ],
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.greyColor),
      ),
      centerTitle: true,
      backgroundColor: AppColor.whiteColor,
    );
  }
}
