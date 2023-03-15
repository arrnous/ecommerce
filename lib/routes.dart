import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/View/Screen/auth/login.dart';
import 'package:ecommerce/View/Screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.onboarding: (context) => const Onboarding()
};
