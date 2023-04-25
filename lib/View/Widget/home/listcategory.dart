import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/Home/home_controller.dart';
import 'package:ecommerce/Data/Model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/color.dart';
import '../../../Core/Constant/imageAsset.dart';
import '../../../Core/Functions/translatedb.dart';
import '../../../linkapi.dart';

class CategoryList extends GetView<HomeControllerImp> {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.category.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoryModel:
                  CategoryModel.fromJson(controller.category[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToCategory(
            controller.category, i, categoryModel.categoryId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),

            height: 70,
            width: 120,
            // padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(
              placeholder: (context, url) => Text("loading"),
              imageUrl: "${AppLink.imageCat}${categoryModel.categoryImage}",
              //  color: AppColor.skyColor,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            "${translateDB(categoryModel.categoryNameAr, categoryModel.categoryName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
