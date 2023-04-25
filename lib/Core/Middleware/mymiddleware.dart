import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedprefs.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.home);
    }
    if (myServices.sharedprefs.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
