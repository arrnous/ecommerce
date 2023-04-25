import 'package:ecommerce/Controller/Auth/signup_controller.dart';
import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/Functions/alertexitapp.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../Core/Class/handlingdataview.dart';
import '../../../Core/Functions/validinput.dart';
import '../../Widget/auth/customtextformauth.dart';
import '../../Widget/auth/sginuptext.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formstate,
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
                          "Sign Up With Your Email And Password Or Continue With Social Media"),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormFeild(
                    valid: (val) {
                      return validInput(val!, 3, 20, "username");
                    },

                    myController: controller.username,
                    hintText: 'Enter Your Username',
                    iconData: Icons.person_2_outlined,
                    labeText: "Username",
                    //  myController: ,
                  ),
                  CustomTextFormFeild(
                    valid: (val) {
                      return validInput(val!, 8, 50, "email");
                    },
                    type: TextInputType.emailAddress,
                    myController: controller.email,
                    hintText: 'Enter Your Email',
                    iconData: Icons.email_outlined,
                    labeText: "Email",
                    //  myController: ,
                  ),
                  CustomTextFormFeild(
                    valid: (val) {
                      return validInput(val!, 10, 10, "phone");
                    },

                    type: TextInputType.number,
                    myController: controller.phone,
                    hintText: 'Enter Your Phone',
                    iconData: Icons.phone_android_outlined,
                    labeText: "Phone",
                    //  myController: ,
                  ),
                  CustomTextFormFeild(
                    valid: (val) {
                      return validInput(val!, 5, 20, "password");
                    },

                    myController: controller.password,
                    obscure: controller.isShowPass,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    hintText: 'Enter Your Password',
                    iconData: Icons.visibility_off,
                    labeText: "Password",
                    //  myController: ,
                  ),
                  HandlingDataViewReq(
                    statusRequest: controller.statusRequest,
                    widget: CustomButtonAuth(
                      text: "Sign Up",
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextSignUporIn(
                    account: "have an account?",
                    text: "Sign In",
                    onTap: () {
                      controller.goToSignIn();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
