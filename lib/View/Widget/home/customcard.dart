import 'package:ecommerce/Controller/Home/home_controller.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: PageView(
        scrollDirection: Axis.horizontal,
        //controller: _controller,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    right: -20,
                    left: -20,
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColor.gold,
                          borderRadius: BorderRadius.circular(160)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                        //   color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: FittedBox(
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: AppColor.greyColor, fontSize: 20),
                        ),
                      ),
                      subtitle: Text(
                        body,
                        style: const TextStyle(
                            color: AppColor.greyColor, fontSize: 20),
                      ),
                      trailing: Image.asset(AppImageAsset.offer),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Image.asset(AppImageAsset.OnboardingImageOne),
          ),
          Center(
            child: Image.asset(AppImageAsset.OnboardingImageOne),
          )
        ],
      ),
    );
  }
}
