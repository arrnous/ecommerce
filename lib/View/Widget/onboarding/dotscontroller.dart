import 'package:ecommerce/Controller/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../Core/Constant/color.dart';
import '../../../Data/Source/Static/static.dart';

class CustomDotsOnboarding extends StatelessWidget {
  const CustomDotsOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
        builder: (control) => SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      OnboardingList.length,
                      (index) => AnimatedContainer(
                            margin: const EdgeInsets.only(right: 4),
                            duration: const Duration(microseconds: 900),
                            width: control.currentpage == index ? 20 : 5,
                            height: 6,
                            decoration: BoxDecoration(
                                color: AppColor.skyColor,
                                borderRadius: BorderRadius.circular(10)),
                          ))
                ],
              ),
            ));
  }
}
