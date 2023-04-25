import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/forgetpass/resetpassword_controller.dart';
import '../../../../Core/Class/statusrequest.dart';
import '../../../../Core/Functions/validinput.dart';
import '../../../Widget/auth/customtextformauth.dart';
import '../../../Widget/auth/customtitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(child: Text("Loading"))
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const CustomTitle(
                        textTitle: "New Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextBody(
                          textbody: "Please Enter New Password"),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFormFeild(
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        myController: controller.password,
                        hintText: 'Enter Your Password',
                        iconData: Icons.email_outlined,
                        labeText: "Password",
                        //  myController: ,
                      ),
                      CustomTextFormFeild(
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        myController: controller.repassword,
                        hintText: 'Re-Enter Your Password',
                        iconData: Icons.email_outlined,
                        labeText: "Password",
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
              ),
      ),
    );
  }
}
