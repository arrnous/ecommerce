import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Functions/handlingdata.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/Data/Source/Remote/search/searchdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Services/services.dart';
import '../../View/Screen/home/home.dart';
import '../../View/Screen/settings/settings.dart';

abstract class HomeScreenController extends GetxController {
  goTo(int i);
  searchList();
  chechSearch(String val);
  goToProductPage(ProductModel productModel);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.find();
  SearchData searchData = SearchData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  int currentPage = 0;
  String? custName;

  TextEditingController? search;
  List<ProductModel> listData = [];

  List<Widget> listPage = [
    const Home(),
    const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("settings"))]),
    const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("profile"))]),
    const Settings()
  ];

  List buttonNames = [
    {"title": "Home", "icon": Icons.home_outlined},
    {"title": "Alerts", "icon": Icons.notifications_active_outlined},
    {"title": "Profile", "icon": Icons.person_2_outlined},
    {"title": "Settings", "icon": Icons.settings}
  ];

  bool isSearch = false;

  @override
  chechSearch(val) {
    listData.clear();
    if (val == "") {
      isSearch = false;
    } else {
      isSearch = true;
      searchList();
    }
    update();
  }

  @override
  goTo(int i) {
    currentPage = i;
    update();
  }

  @override
  goToProductPage(productModel) {
    Get.toNamed("productdetails", arguments: {"productmodel": productModel});
  }

  @override
  searchList() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(search!.text);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else if (response["status"] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        statusRequest = StatusRequest.serverException;
      }
    }
    update();
  }

  @override
  void onInit() {
    custName = myServices.sharedprefs.getString("username").toString();
    search = TextEditingController();
    super.onInit();
  }
}
