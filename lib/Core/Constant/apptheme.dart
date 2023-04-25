import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
  primarySwatch: Colors.blue,
);
