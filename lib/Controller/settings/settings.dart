import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  @override
  logout() {
    myServices.sharedprefs.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
