import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/product/prodetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';
import '../../../linkapi.dart';

class TopPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            /*   borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)) */
          ),
        ),
        Center(
          child: Hero(
            tag: "${controller.productModel.proId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imagePro}/${controller.productModel.proImage!}",
              height: Get.height / 4,
              width: Get.width / 1.2,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
