import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  checkEmail() {}

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
