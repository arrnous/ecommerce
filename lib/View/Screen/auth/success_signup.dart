import 'package:ecommerce/View/Widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            const Icon(
              Icons.check_circle_outline,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("............."),
            Spacer(),
            CustomButtonAuth(
              text: "Login",
              onPressed: () {},
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
