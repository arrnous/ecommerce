import 'package:ecommerce/Controller/onboarding.dart';
import 'package:ecommerce/View/Widget/onboarding/customslider.dart';
import 'package:ecommerce/View/Widget/onboarding/dotscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../Widget/onboarding/custombutton.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      body: SafeArea(
        top: true,
        minimum: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Expanded(flex: 3, child: CustomSliderOnboarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotsOnboarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnboarding()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
