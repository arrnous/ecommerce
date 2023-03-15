import 'package:ecommerce/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedprefs.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langShared = myServices.sharedprefs.getString("lang");
    if (langShared == "ar") {
      language = const Locale("ar");
    } else if (langShared == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
