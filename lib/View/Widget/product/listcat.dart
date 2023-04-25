import 'package:ecommerce/Controller/product/product_controller.dart';
import 'package:ecommerce/Data/Model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';
import '../../../Core/Functions/translatedb.dart';

class CategoryListPro extends GetView<ProductControllerImp> {
  const CategoryListPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 60,
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

class Categories extends GetView<ProductControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        controller.changeCat(i, categoryModel.categoryId!);
      },
      child: Column(
        children: [
          GetBuilder<ProductControllerImp>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      color: AppColor.primaryColor,
                      // borderRadius:BorderRadius.zero(),
                      border: Border.all(
                        color: AppColor.black,
                      ),
                      borderRadius: BorderRadius.circular(5))
                  : BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
              height: 30,
              child: FittedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "${translateDB(categoryModel.categoryNameAr, categoryModel.categoryName)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 17, color: AppColor.black),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
