import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/favorite/favorite_controller.dart';
import 'package:ecommerce/Data/Model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';
import '../../../Core/Functions/translatedb.dart';
import '../../../linkapi.dart';

class CustomFavoriteList extends GetView<FavoriteControllerImp> {
  final MyFavoriteModel myFavoriteModel;

  const CustomFavoriteList({
    super.key,
    required this.myFavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductPage(productModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Hero(
              tag: "${myFavoriteModel.proId}",
              child: CachedNetworkImage(
                height: 100,
                fit: BoxFit.fill,
                imageUrl: "${AppLink.imagePro}/${myFavoriteModel.proImage!}",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${translateDB(myFavoriteModel.proNameAr, myFavoriteModel.proName)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rating 3.5",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.silver,
                    )),
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
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${myFavoriteModel.proPrice} \$",
                    style:
                        const TextStyle(color: AppColor.skyColor, fontSize: 17),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFavorite(myFavoriteModel.favId!);
                    },
                    icon: const Icon(Icons.delete_outline),
                    iconSize: 22,
                    color: AppColor.tomatoRed,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
