import 'package:ecommerce/Controller/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';

class CustomButtonOnboarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 42,
      decoration: const BoxDecoration(color: AppColor.skyColor),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        child: Text("2".tr),
      ),
    );
  }
}
