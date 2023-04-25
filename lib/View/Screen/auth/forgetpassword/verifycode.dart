import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../Controller/forgetpass/forgetpass_controller.dart';
import '../../../../Controller/forgetpass/verifycode_controller.dart';
import '../../../Widget/auth/customtextformauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: ListView(
          children: [
            /*   const CustomTitle(
              textTitle: "Welcome Back",
            ), */
            const SizedBox(
              height: 10,
            ),
            const CustomTextBody(
                textbody:
                    "Please Enter The Digit Code Sent To Arnous@hotmail.com"),
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
                controller.goToResetPassword(verificationCode);

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
          ],
        ),
      ),
    );
  }
}
