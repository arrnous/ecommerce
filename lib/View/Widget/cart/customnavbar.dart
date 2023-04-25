import 'package:ecommerce/Controller/cart/cart_controller.dart';
import 'package:ecommerce/View/Widget/cart/customcoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/color.dart';
import 'orderbutton.dart';

class CustomNavBarCart extends StatelessWidget {
  final String totalprice;
  final String discount;
  final String price;
  final void Function() onApply;
  final void Function() onPlaceOrder;
  final TextEditingController couponController;
  const CustomNavBarCart(
      {super.key,
      required this.totalprice,
      required this.discount,
      required this.price,
      required this.couponController,
      required this.onApply,
      required this.onPlaceOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            /*   decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 100,
                  spreadRadius: 2,
                  offset: Offset(0, -110),
                  color: Color.fromARGB(255, 214, 214, 214))
            ], border: Border(top: BorderSide(color: AppColor.greyColor))), */
            child: Column(
              children: [
                GetBuilder<CartControllerImp>(
                    builder: (controller) => controller.copName == null
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CustomCoupon(
                                        text: "apply", onPressed: onApply)),
                                const SizedBox(width: 10),
                                Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: couponController,
                                      decoration: const InputDecoration(
                                          hintText: "Coupon Code",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          isDense: true,
                                          border: OutlineInputBorder()),
                                    )),
                              ],
                            ),
                          )
                        : const SizedBox.shrink()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: TextStyle(fontSize: 18)),
                    Text("$price", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount", style: TextStyle(fontSize: 18)),
                    Text("$discount", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Divider(
                  height: 8,
                  thickness: 1.5,
                  color: AppColor.silver,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("$totalprice", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
          CustomCartButton(
            text: "Place Order",
            onPressed: onPlaceOrder,
          )
        ],
      ),
    );
  }
}
