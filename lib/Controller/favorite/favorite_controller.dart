import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Model/myfavoritemodel.dart';
import 'package:ecommerce/Data/Source/Remote/favorite/favorite_data.dart';
import 'package:ecommerce/Data/Source/Remote/search/searchdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Data/Model/productmodel.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  addFav(String proId);
  removeFav(String proId);
  viewFavorite();
  deleteFavorite(String favId);
  chechSearch(val);
  searchList();
  goToProductPage(ProductModel productModel);
}

class FavoriteControllerImp extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  Map isFavorite = {};

  //search
  SearchData searchData = SearchData(Get.find());
  TextEditingController? search;
  List<ProductModel> listData = [];

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

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
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addFav(proId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFav(
        myServices.sharedprefs.getString("id")!, proId);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        Get.rawSnackbar(title: "alert", messageText: const Text("fav added"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  @override
  removeFav(proId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFav(
        myServices.sharedprefs.getString("id")!, proId);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        Get.rawSnackbar(title: "alert", messageText: const Text("fav removed"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    //update();
  }

  @override
  viewFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .viewFavorite(myServices.sharedprefs.getString("id")!);
    print("================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("data :");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteFavorite(favId) {
    var response = favoriteData.deleteFavorite(favId);
    print("================$response");
    data.removeWhere((element) => element.favId == favId);
    update();
  }

  @override
  void onInit() {
    viewFavorite();
    search = TextEditingController();
    super.onInit();
  }
}
