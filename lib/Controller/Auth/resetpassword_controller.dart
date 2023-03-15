import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  ResetPass();
  goToSuccessResetPass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  @override
  ResetPass() {}

  @override
  goToSuccessResetPass() {
    Get.offNamed(AppRoute.successResetPass);
  }

  @override
  void onInit() {
    repassword = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    repassword.dispose();
    password.dispose();

    super.dispose();
  }
}
