import 'package:ecommerce/Controller/Home/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customnavbarbutton.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomNavBarButton(
                      active: controller.currentPage == i ? true : false,
                      buttonName: controller.buttonNames[i]['title'],
                      icon: controller.buttonNames[i]['icon'],
                      onPressed: () {
                        controller.goTo(i);
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
