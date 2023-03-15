import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:ecommerce/View/Widget/auth/logoauth.dart';
import 'package:ecommerce/View/Widget/auth/sginuptext.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../Controller/Auth/login_controller.dart';
import '../../Widget/auth/customtextformauth.dart';
import '../../Widget/auth/customtitle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
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
              myController: controller.email,
              hintText: 'Enter Your Email',
              iconData: Icons.email_outlined,
              labeText: "Email",
              //  myController: ,
            ),
            CustomTextFormFeild(
              myController: controller.password,
              hintText: 'Enter Your Password',
              iconData: Icons.lock_outline,
              labeText: "Password",
              //  myController: ,
            ),
            InkWell(
              onTap: () {
                controller.goToForgetPassowrd();
              },
              child: const Text(
                "Forget Password?",
                textAlign: TextAlign.center,
              ),
            ),
            CustomButtonAuth(
              text: "Sign In",
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextSignUporIn(
              account: "Don't have an account?",
              text: "SignUp",
              onTap: () {
                controller.goToSignUp();
              },
            )
          ],
        ),
      ),
    );
  }
}
