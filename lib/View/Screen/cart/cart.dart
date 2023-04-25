import 'package:ecommerce/Controller/cart/cart_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/cart/cartappbar.dart';
import '../../Widget/cart/customcartlist.dart';
import '../../Widget/cart/customnavbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.whiteColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CartAppBar(
              title: "11".tr,
              icon: Icons.shopping_cart_outlined,
              count: "${controller.totalProduct}",
            ),
          ),
          body: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...List.generate(
                    controller.data.length,
                    (index) => CustomCartList(
                      name: "${controller.data[index].proName}",
                      price: "${controller.data[index].proprice} SR",
                      count: "${controller.data[index].procount}",
                      imageName: "${controller.data[index].proImage}",
                      onAdd: () {
                        controller.addCart(controller.data[index].proId!);
                        controller.updatePage();
                      },
                      onRemove: () {
                        controller.removeCart(controller.data[index].proId!);
                        controller.updatePage();
                      },
                    ),
                  )
                ],
              )),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: CustomNavBarCart(
              price: "${controller.orderPrice}",
              discount: "${controller.discountCoupon} %",
              totalprice: " ${controller.getTotalPrice()}",
              couponController: controller.couponController,
              onApply: () {
                controller.checkCoupn();
              },
              onPlaceOrder: () {
                Get.toNamed(AppRoute.checkout);
              },
            ),
          )),
    );
  }
}
