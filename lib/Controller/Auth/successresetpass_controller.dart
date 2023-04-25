import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPassController extends GetxController {
  goToLogin();
}

class SuccessResetPassControllerImp extends SuccessResetPassController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
