import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth/resetpassword_controller.dart';
import '../../../Widget/auth/customtextformauth.dart';
import '../../../Widget/auth/customtitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: ListView(
          children: [
            const CustomTitle(
              textTitle: "New Password",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextBody(textbody: "Please Enter New Password"),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormFeild(
              myController: controller.password,
              hintText: 'Enter Your Password',
              iconData: Icons.email_outlined,
              labeText: "Email",
              //  myController: ,
            ),
            CustomTextFormFeild(
              myController: controller.password,
              hintText: 'Re-Enter Your Password',
              iconData: Icons.email_outlined,
              labeText: "Email",
              //  myController: ,
            ),
            CustomButtonAuth(
              text: "Save",
              onPressed: () {
                controller.goToSuccessResetPass();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
