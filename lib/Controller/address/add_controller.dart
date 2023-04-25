import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Functions/handlingdata.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Source/Remote/address/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  addAddress();
}

class AddressControllerImp extends AddressController {
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();

  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;
  String? lat;
  String? long;

  intialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print("==== lat : $lat === long : $long");

    // controller
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  addAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.addData(
        myServices.sharedprefs.getString("id")!,
        name.text,
        city.text,
        street.text,
        lat!,
        long!);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
