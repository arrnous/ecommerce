import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/favorite/favorite_controller.dart';
import 'package:ecommerce/Controller/product/product_controller.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/color.dart';
import '../../../Core/Functions/translatedb.dart';
import '../../../linkapi.dart';

class CustomProList extends GetView<ProductControllerImp> {
  final ProductModel productModel;

  const CustomProList({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductPage(productModel);
      },
      child: Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${productModel.proId}",
                      child: CachedNetworkImage(
                        fadeInCurve: Curves.bounceIn,
                        height: 100,
                        fit: BoxFit.fill,
                        imageUrl:
                            "${AppLink.imagePro}/${productModel.proImage!}",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: Text(
                        "${translateDB(productModel.proNameAr, productModel.proName)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, height: 1.1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Rating 3.5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.silver,
                                height: 2)),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColor.primaryColor,
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            productModel.proOffer != "0"
                                ? Text("${productModel.proPrice} SR",
                                    style: const TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: 13,
                                        decoration: TextDecoration.lineThrough,
                                        height: 1.1))
                                : const SizedBox.shrink(),
                            //const SizedBox(width: 2),
                            Text(
                              "${productModel.discount} SR",
                              style: const TextStyle(
                                  color: AppColor.tomatoRed,
                                  fontSize: 17,
                                  height: 1.1),
                            )
                          ],
                        ),
                        const Spacer(),
                        GetBuilder<FavoriteControllerImp>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[productModel.proId] ==
                                    "1") {
                                  controller.setFavorite(
                                      productModel.proId, "0");
                                  controller.removeFav(productModel.catId!);
                                } else {
                                  controller.setFavorite(
                                      productModel.proId, "1");
                                  controller.addFav(productModel.catId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[productModel.proId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 25,
                                color: AppColor.tomatoRed,
                              )),
                        )
                      ],
                    ),
                  ]),
            ),
            productModel.proOffer != "0"
                ? Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset(
                      AppImageAsset.offer,
                      width: 40,
                      height: 40,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
