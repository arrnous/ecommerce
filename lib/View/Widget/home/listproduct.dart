import 'package:ecommerce/Controller/Home/home_controller.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Constant/color.dart';
import '../../../Core/Functions/translatedb.dart';
import '../../../linkapi.dart';

class ProductList extends GetView<HomeControllerImp> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.product.length,
        itemBuilder: (context, index) {
          return Products(
              productModel: ProductModel.fromJson(controller.product[index]));
        },
      ),
    );
  }
}

class Products extends GetView<HomeControllerImp> {
  final ProductModel productModel;
  const Products({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProduct();
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 130,
            width: 140,
            decoration: BoxDecoration(
                color: AppColor.silver,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "${AppLink.imagePro}${productModel.proImage}",
                height: 100,
                width: 120,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              left: 10,
              child: Text(
                  "${translateDB(productModel.proNameAr, productModel.proName)}")),
        ],
      ),
    );
  }
}
