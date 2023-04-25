import 'package:ecommerce/Controller/product/prodetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/color.dart';

class SubProductList extends GetView<ProductDetailsControllerImp> {
  const SubProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subProduct.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: controller.subProduct[index]['active'] == "1"
                    ? AppColor.skyColor
                    : AppColor.whiteColor,
                border: Border.all(color: AppColor.skyColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subProduct[index]['name'],
              style: TextStyle(
                  color: controller.subProduct[index]['active'] == "1"
                      ? AppColor.whiteColor
                      : AppColor.skyColor),
            ),
          ),
        )
      ],
    );
  }
}
