import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Functions/translatedb.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/product/prodetails_controller.dart';
import '../../Widget/productdetails/priceandqty.dart';
import '../../Widget/productdetails/subprolist.dart';
import '../../Widget/productdetails/toppage.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: AppColor.greyColor),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => ListView(children: [
            const TopPageDetails(),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${translateDB(controller.productModel.proNameAr, controller.productModel.proName)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: AppColor.greyColor),
                  ),
                  //SizedBox(height: 10),
                  PriceAndQty(
                    price: "${controller.productModel.discount} SR",
                    count: "${controller.productCount}",
                    onAdd: () {
                      controller.add();
                      //controller.addCart(controller.productModel.proId!);
                    },
                    onRemove: () {
                      controller.remove();
                      //controller.removeCart(controller.productModel.proId!);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${translateDB(controller.productModel.proDescAr, controller.productModel.proDesc)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColor.skyColor),
                  ),
                  const SizedBox(height: 10),
                  /*   const Text(
                    "Color",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColor.skyColor),
                  ),

                  // list
                  const SubProductList() */
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primaryColor,
                  ),
                  height: 60,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      Get.toNamed(AppRoute.cart);
                      // controller.addItemToCart(controller.productModel.proId);
                    },
                    child: const Text(
                      "Go to cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor,
                          fontSize: 20),
                    ),
                  ),
                )));
  }
}
