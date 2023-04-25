import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/settings/settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Scaffold(
      // backgroundColor: AppColor.tomatoRed,
      body: Container(
        color: AppColor.whiteColor,
        child: ListView(children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width / 2,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          spreadRadius: 2,
                          offset: Offset(0, 2),
                          color: AppColor.silver)
                    ],
                  ),
                ),
                Positioned(
                    top: Get.width / 3.3,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 1),
                                color: AppColor.silver)
                          ],
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColor.whiteColor,
                        backgroundImage:
                            AssetImage(AppImageAsset.OnboardingImageOne),
                      ),
                    )),
              ]),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    trailing: Switch(
                      activeColor: AppColor.primaryColor,
                      value: true,
                      onChanged: (value) {},
                    ),
                    title: Text("Notifications"),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    title: Text("address"),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("About us"),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Contact us"),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.logout),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
