import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Source/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currentpage = 0;
  late PageController pagecontrol;

  MyServices myServices = Get.find();

  @override
  next() {
    currentpage++;

    if (currentpage > OnboardingList.length - 1) {
      // print("last");
      Get.offAllNamed(AppRoute.login);
      myServices.sharedprefs.setString("step", "1");
    } else {
      pagecontrol.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontrol = PageController();

    super.onInit();
  }
}
