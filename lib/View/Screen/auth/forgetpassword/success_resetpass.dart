import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth/successresetpass_controller.dart';
import '../../../Widget/auth/custombuttonauth.dart';

class SuccessResetPass extends StatelessWidget {
  const SuccessResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPassControllerImp controller =
        Get.put(SuccessResetPassControllerImp());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              Icons.check_circle_outline,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("............."),
            const Spacer(),
            CustomButtonAuth(
              text: "Login",
              onPressed: () {
                controller.goToLogin();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
