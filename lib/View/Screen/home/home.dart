import 'package:ecommerce/Controller/Home/home_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';

import 'package:ecommerce/View/Widget/home/listcategory.dart';
import 'package:ecommerce/View/Widget/home/listproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/home/customcard.dart';
import '../../Widget/home/customtexthome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            CustomCardHome(
                title: "مدار الطارق \nاقوى العروض بمناسبة الشهر الفضيل",
                body: "cash back 20%"),
            // categories
            CustomTextHome(text: "Categories"),
            CategoryList(),
            // products
            CustomTextHome(text: "Products For You"),
            ProductList(),

            // Text(controller.product.length.toString())
          ],
        ),
      ),
    );
  }
}
