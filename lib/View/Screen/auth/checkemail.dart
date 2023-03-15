import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../Controller/Auth/checkemail.dart';
import '../../Widget/auth/customtextformauth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Check Email",
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
                    "Please Enter Your Email Address To Receive A Verifaction Code"),
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
            CustomButtonAuth(
              text: "Check",
              onPressed: () {
                controller.goToSuccessSignUp();
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
