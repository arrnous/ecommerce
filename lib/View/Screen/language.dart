import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Localization/changelang.dart';
import '../Widget/language/custombutton.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            "1".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonLang(
              textbutton: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onboarding);
              }),
          CustomButtonLang(
              textbutton: "En",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onboarding);
              }),
        ],
      ),
    ));
  }
}
