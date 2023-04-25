import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../Controller/Auth/verifycodesignup_controller.dart';
import '../../../../Core/Class/statusrequest.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Verification Code",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(
                child: Text("loading"),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: ListView(
                  children: [
                    /*   const CustomTitle(
                textTitle: "Welcome Back",
              ), */
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBody(
                        textbody:
                            "Please Enter The Digit Code Sent To ${controller.email}"),
                    const SizedBox(
                      height: 50,
                    ),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(10),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled

                      onSubmit: (String verificationCode) {
                        controller.goToSuccessSignUp(verificationCode);

                        /*  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }); */
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        controller.resend();
                      },
                      child: const Center(
                          child: Text(
                        "Resend Code",
                        style:
                            TextStyle(color: AppColor.tomatoRed, fontSize: 20),
                      )),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
