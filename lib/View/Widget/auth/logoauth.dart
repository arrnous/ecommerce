import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 150,
      width: double.infinity,
    );
  }
}
