import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/View/Screen/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Core/Services/services.dart';
import '../../Data/Source/Remote/cart/cart_data.dart';

abstract class ProductDetailsController extends GetxController {
  addCart(String proId);
  removeCart(String proId);
  getCount(String proId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  int productCount = 0;
  late ProductModel productModel;

  //New Cart list
  RxList<ProductModel> cart = <ProductModel>[].obs;
  GetStorage box = GetStorage();

  // add
  void addItemToCart(proId) {
    proId.proQty = 1;
    cart.add(proId);

    List<Map<String, dynamic>> items_cart =
        cart.map((ProductModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Remove
  void decreaseQtyOfItemInCart(proId) {
    if (proId.proQty == 1) {
      // remove the selected item from list of cart
      cart.removeWhere(
          (ProductModel selectedItem) => selectedItem.proId == proId);
    } else {
      // remove the selected item from list of cart
      cart.removeWhere(
          (ProductModel selectedItem) => selectedItem.proId == proId);

      // substract qty by 1
      proId.proQty--;

      // add again the model with the substracted one qty
      cart.add(proId);
    }

    // Write current list of cart into session
    List<Map<String, dynamic>> items_cart =
        cart.map((ProductModel e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
  }

  // -------------------------------  New Cart   ----------------------------------------------

  //List<CartModel> data = [];
  //double orderPrice = 0.0;
  //int totalProduct = 0;

  List subProduct = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "black", "id": 2, "active": "0"},
    {"name": "blue", "id": 3, "active": "1"}
  ];

  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productmodel'];
    productCount = await getCount(productModel.proId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addCart(proId) async {
    // data.clear();
    //statusRequest = StatusRequest.loading;
    var response =
        await cartData.addCart(myServices.sharedprefs.getString("id")!, proId);
    debugPrint("================ $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        /*  Get.rawSnackbar(
            title: "alert", messageText: const Text("added item to cart")); */
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  @override
  removeCart(proId) async {
    // data.clear();
    //  statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        myServices.sharedprefs.getString("id")!, proId);
    print("================ $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //  data.addAll(response['data']);
        /*  Get.rawSnackbar(
            title: "alert",
            messageText: const Text("removed product from cart")); */
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  @override
  getCount(proId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.getCount(myServices.sharedprefs.getString("id")!, proId);
    print("================ $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int productCount = 0;
        productCount = int.parse(response['data']);
        print("============== $productCount");
        return productCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  add() {
    addCart(productModel.proId!);
    productCount++;
    update();
  }

  remove() {
    if (productCount > 0) {
      productCount--;
      removeCart(productModel.proId!);
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
