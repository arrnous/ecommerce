import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Source/Remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassowrd();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPass = true;

  LoginData loginData = LoginData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print('================ $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //  data.addAll(response['data']);
          if (response['data']['cust_approve'] == "1") {
            myServices.sharedprefs.setString('id', response['data']['cust_id']);
            myServices.sharedprefs
                .setString('username', response['data']['cust_name']);
            myServices.sharedprefs
                .setString('email', response['data']['cust_email']);
            myServices.sharedprefs
                .setString('phone', response['data']['cust_phone']);
            myServices.sharedprefs.setString('step', '2');
            Get.offNamed(AppRoute.home);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email or Password is not correct');
          // statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpControllerImp>();
    } else {
      print('error valid');
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassowrd() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
