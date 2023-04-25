import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Functions/validinput.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:ecommerce/View/Widget/auth/logoauth.dart';
import 'package:ecommerce/View/Widget/auth/sginuptext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/login_controller.dart';
import '../../../Core/Class/handlingdataview.dart';
import '../../../Core/Functions/alertexitapp.dart';
import '../../Widget/auth/customtextformauth.dart';
import '../../Widget/auth/customtitle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    /*  FirebaseMessaging.onMessage.listen((message) {
      print('Got a message whilst in the foreground!');

      if (message.notification != null) {
        final snackBar = SnackBar(
          content: Text(message.notification?.title ?? '', maxLines: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }); */
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: Text(
          "3".tr,
          style: const TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const CustomTitle(
                    textTitle: "Welcome Back",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBody(
                      textbody:
                          "Sign In With Your Email And Password Or Continue With Social Media"),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormFeild(
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    type: TextInputType.emailAddress,
                    myController: controller.email,
                    hintText: '5'.tr,
                    iconData: Icons.email_outlined,
                    labeText: "6".tr,
                    //  myController: ,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomTextFormFeild(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      obscure: controller.isShowPass,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      myController: controller.password,
                      hintText: '7'.tr,
                      iconData: Icons.visibility_off,
                      labeText: "8".tr,
                      //  myController: ,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToForgetPassowrd();
                    },
                    child: Text(
                      "4".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  HandlingDataViewReq(
                    statusRequest: controller.statusRequest,
                    widget: CustomButtonAuth(
                      text: "3".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextSignUporIn(
                    account: "9".tr,
                    text: "10".tr,
                    onTap: () {
                      controller.goToSignUp();
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
