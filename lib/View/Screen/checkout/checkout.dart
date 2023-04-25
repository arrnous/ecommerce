import 'package:ecommerce/Controller/checkout/checkout_controller.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/imageAsset.dart';
import 'package:ecommerce/Core/Shared/customtitleappbar.dart';
import 'package:ecommerce/View/Widget/checkout/cardaddress.dart';
import 'package:ecommerce/View/Widget/checkout/cardpaymentmethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/checkout/cardordertype.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomTitleAppBar(
          title: "Checkout",
        ),
      ),
      backgroundColor: AppColor.whiteColor,
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) => Container(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              CardPaymentMethod(
                title: "Cash on Delivery",
                isActive: controller.paymentMethod == "cash" ? true : false,
                onTap: () {
                  controller.choosePaymentMethod("cash");
                },
              ),
              CardPaymentMethod(
                title: "Payment Cards",
                isActive: controller.paymentMethod == "Payment" ? true : false,
                onTap: () {
                  controller.choosePaymentMethod("Payment");
                },
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "Order Type",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CardOrderType(
                      onTap: () {
                        controller.chooseOrderType("Delivery");
                      },
                      title: "Delivery",
                      image: AppImageAsset.logo,
                      isActive:
                          controller.orderType == "Delivery" ? true : false,
                    ),
                    const SizedBox(width: 10),
                    CardOrderType(
                        onTap: () {
                          controller.chooseOrderType("takeaway");
                        },
                        image: AppImageAsset.logo,
                        title: "takeaway",
                        isActive:
                            controller.orderType == "takeaway" ? true : false)
                  ],
                ),
              ),
              controller.orderType == "Delivery"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...List.generate(
                          controller.data.length,
                          (index) => CardAddress(
                            title: "${controller.data[index].addName}",
                            body:
                                "${controller.data[index].addCity}  / ${controller.data[index].addStreet}  ",
                            isActive: controller.addressId ==
                                    controller.data[index].addId
                                ? true
                                : false,
                            onTap: () {
                              controller
                                  .chooseAddress(controller.data[index].addId!);
                            },
                          ),
                        )
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(),
        child: MaterialButton(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.gold,
          onPressed: () {},
          child: Text(
            "Checkout",
            style: TextStyle(
                color: AppColor.greyColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
