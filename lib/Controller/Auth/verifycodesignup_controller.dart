import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Data/Source/Remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeData = VerifyCodeSignUpData(Get.find());
  // List data = [];
  StatusRequest? statusRequest;

  String? email;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, verificationCode);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code is not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  resend() {
    verifyCodeData.resendCode(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
