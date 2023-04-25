import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Data/Source/Remote/auth/signup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPass = true;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, password.text, email.text, phone.text);
      print("================ $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Phone or email already exits");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpControllerImp>();
    } else {
      print("error valid");
    }
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }
}
