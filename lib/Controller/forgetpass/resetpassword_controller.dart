import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Data/Source/Remote/forgetpass/resetpass.dart';

abstract class ResetPasswordController extends GetxController {
  resetPass();
  goToSuccessResetPass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPassData resetPassData = ResetPassData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  StatusRequest? statusRequest;

  @override
  resetPass() {}

  @override
  goToSuccessResetPass() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Your Password dous not Match");
    } else {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPassData.postData(email!, password.text);
        print("================" + response.toString());
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            //  data.addAll(response['data']);
            Get.offNamed(AppRoute.successResetPass);
          } else {
            Get.defaultDialog(title: "Warning", middleText: "Try again");
            statusRequest = StatusRequest.failure;
          }
        }
        update();

        // Get.delete<SignUpControllerImp>();
      } else {
        print("error valid");
      }
    }
  }

  @override
  void onInit() {
    repassword = TextEditingController();
    password = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    repassword.dispose();
    password.dispose();
    super.dispose();
  }
}
