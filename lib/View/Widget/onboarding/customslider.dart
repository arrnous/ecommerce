import 'package:ecommerce/Controller/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../Core/Constant/color.dart';
import '../../../Data/Source/Static/static.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pagecontrol,
        onPageChanged: (value) {
          print(value);
          controller.onpagechanged(value);
        },
        itemCount: OnboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  OnboardingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  OnboardingList[i].image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      OnboardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ],
            ));
  }
}
