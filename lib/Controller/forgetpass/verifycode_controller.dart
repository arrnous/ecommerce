import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Data/Source/Remote/forgetpass/verifycodepass.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;

  VerifyCodePassData verifyCodePassData = VerifyCodePassData(Get.find());
  StatusRequest? statusRequest;

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodePassData.postData(email!, verifycode);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code is not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
