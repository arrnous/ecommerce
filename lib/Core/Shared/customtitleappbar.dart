import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant/color.dart';

class CustomTitleAppBar extends GetView {
  final String? title;

  @override
  //Size get preferredSize => const Size.fromHeight(60);
  CustomTitleAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      title: Text(
        title.toString(),
        style: const TextStyle(
            color: AppColor.greyColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColor.whiteColor,
      iconTheme: const IconThemeData(color: AppColor.black),
    );
  }
}
