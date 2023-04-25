import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Data/Source/Remote/forgetpass/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest;

  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("================" + response.toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email is not found !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpControllerImp>();
    } else {
      print("error valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
