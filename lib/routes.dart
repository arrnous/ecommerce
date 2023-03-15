import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/View/Screen/auth/checkemail.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/forgetpass.dart';
import 'package:ecommerce/View/Screen/auth/login.dart';
import 'package:ecommerce/View/Screen/auth/signup.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/success_resetpass.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/View/Screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'View/Screen/auth/forgetpassword/resetpassoword.dart';
import 'View/Screen/auth/success_signup.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.onboarding: (context) => const Onboarding(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.successResetPass: (context) => const SuccessResetPass(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
};
