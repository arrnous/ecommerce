import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:ecommerce/View/Widget/auth/customtextbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../Controller/forgetpass/forgetpass_controller.dart';
import '../../../../Core/Functions/validinput.dart';
import '../../../Widget/auth/customtextformauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.skyColor,
        elevation: 0.0,
        title: const Text(
          "Forget Password",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(child: Text("Loadin"))
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
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
                              "Please Enter Your Email Address To Receive A Verifaction Code"),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFormFeild(
                        valid: (val) {
                          return validInput(val!, 5, 30, "email");
                        },
                        myController: controller.email,
                        hintText: 'Enter Your Email',
                        iconData: Icons.email_outlined,
                        labeText: "Email",
                        //  myController: ,
                      ),
                      CustomButtonAuth(
                        text: "Check",
                        onPressed: () {
                          controller.checkEmail();
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
