import 'package:ecommerce/Controller/Auth/signup_controller.dart';
import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DbFunctions());
  }
}
