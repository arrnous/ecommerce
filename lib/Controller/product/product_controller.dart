import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/Data/Source/Remote/product/productdata.dart';
import 'package:ecommerce/Data/Source/Remote/search/searchdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';

abstract class ProductController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getProduct(String catId);
  goToProductPage(ProductModel productModel);
  chechSearch(val);
  searchList();
}

class ProductControllerImp extends ProductController {
  List category = [];
  int? selectedCat;
  String? catId;
  // String? catName;

  ProductData productData = ProductData(Get.find());
  MyServices myServices = Get.find();

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  //search
  SearchData searchData = SearchData(Get.find());
  TextEditingController? search;
  List<ProductModel> listData = [];

  //New Cart list
  RxList<ProductModel> cart = <ProductModel>[].obs;
  GetStorage box = GetStorage();

  @override
  getProduct(catId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await productData.getData(
        catId, myServices.sharedprefs.getString("id")!);
    debugPrint("================  $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        // print("hi");
      }
    }
    update();
  }

  @override
  goToProductPage(productModel) {
    Get.toNamed("productdetails", arguments: {"productmodel": productModel});
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catId = catval;
    getProduct(catId!);
    update();
  }

  //search
  bool isSearch = false;

  @override
  chechSearch(val) {
    listData.clear();

    // New Cart
    cart.clear();
    if (val == "") {
      isSearch = false;
    } else {
      isSearch = true;
      searchList();
    }
    update();
  }

  @override
  searchList() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(search!.text);
    debugPrint("================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //listData.clear();

        // New Cart
        cart.clear();
        List responseData = response['data'];
        // TODO
        //  cart.addAll(responseData.map((e) => ProductModel.fromJson(e)));
        listData.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  intialData() {
    category = Get.arguments['category'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catid'];
  }

  @override
  void onInit() {
    intialData();
    getProduct(catId!);
    search = TextEditingController();
    super.onInit();
  }
}
