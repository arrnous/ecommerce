import 'package:ecommerce/Data/Model/cartmodel.dart';
import 'package:ecommerce/Data/Model/couponmodel.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/Data/Source/Remote/cart/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Core/Class/statusrequest.dart';
import '../../Core/Functions/handlingdata.dart';
import '../../Core/Services/services.dart';

abstract class CartController extends GetxController {
  addCart(String proId);
  removeCart(String proId);
  viewCart();
  checkCoupn();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());

  // List<MyFavoriteModel> data = [];

  TextEditingController couponController = TextEditingController();
  CouponModel? couponModel;
  int discountCoupon = 0;
  String? copName;

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double orderPrice = 0.0;
  int totalProduct = 0;

  @override
  addCart(proId) async {
    // data.clear();
    //statusRequest = StatusRequest.loading;
    var response =
        await cartData.addCart(myServices.sharedprefs.getString("id")!, proId);
    print("================ $response");
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
  viewCart() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedprefs.getString("id")!);
    print("================ $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        if (response['data']['status'] == "success") {
          List responseData = response['data']['data'];
          Map responseCount = response['count'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalProduct = int.parse(responseCount['totalcount']);
          orderPrice = double.parse(responseCount['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVar() {
    totalProduct = 0;
    orderPrice = 0.0;
    data.clear();
  }

  updatePage() {
    resetVar();
    viewCart();
  }

  @override
  checkCoupn() async {
    // data.clear();
    //statusRequest = StatusRequest.loading;
    // update();
    var response = await cartData.checkCoupon(couponController.text);
    print("================ $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.copDiscount!);
        copName = couponModel!.copName;
      } else {
        //statusRequest = StatusRequest.failure;
        discountCoupon = 0;
        copName = null;
      }
    }
    update();
  }

  getTotalPrice() {
    return (orderPrice - orderPrice * discountCoupon / 100);
  }

  @override
  void onInit() {
    viewCart();
    couponController = TextEditingController();
    super.onInit();
  }
}

class CartController1 extends GetxController {
  RxList<ProductModel> cart = <ProductModel>[].obs;
  GetStorage box = GetStorage();
  RxInt grandTotal = 0.obs;
  // Map<String, dynamic> userSession = GetStorage().read('auth');

  // Removing selected item from the list of cart
  void removeSelectedItemFromCart(int index) {
    cart.removeAt(index);

    List<Map<String, dynamic>> items_cart =
        cart.map((ProductModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Increasing qty of the selected item
  void increaseQtyOfSelectedItemInCart(int index) {
    cart[index].proId;

    List<Map<String, dynamic>> items_cart =
        cart.map((ProductModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Decrease qty of the selected item
  void decreaseQtyOfSelectedItemInCart(int index, proId) {
    if (proId.qty == 1) {
      cart.removeAt(index);
    } else {
      //cart[index].proId--;
    }
    List<Map<String, dynamic>> items_cart =
        cart.map((ProductModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Calculate the grand total value
  void calculateGrandTotal() {
    grandTotal.value = 0;
    for (int i = 0; i < cart.length; i++) {
      grandTotal = grandTotal +
          int.parse(cart[i].proQty!) * int.parse(cart[i].proPrice!);
    }
  }
/* 
  // listen for updates the list of cart from session
  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      if (updatedValue is List) {
        cart.clear();
        cart.addAll(updatedValue.map((e) => ProductModel.fromMap(e)).toList());
        calculateGrandTotal();
      }
    });
  } */
/* 
  // Updating list of cart with the session data
  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        cart.clear();
        cart.addAll(value.map((e) => Airsoft.fromMap(e)).toList());
        calculateGrandTotal();
      }
    }
    updatingSession();
  } */

  @override
  void onReady() {
    //  getUpdatedSessionCartData();
    super.onReady();
  }

  // When transaction has been made,
  // clear the session, set grandTotal to zero
  // remove the dialog and show the snackbar
  void transactionCompleted() {
    box.write("items_cart", []).then((value) {
      grandTotal.value = 0;
      cart.clear();
      Get.back();
      Get.snackbar("Message", "Transaction succeed ! ",
          colorText: Colors.white,
          backgroundColor: Color(0xff4D4D4D),
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
