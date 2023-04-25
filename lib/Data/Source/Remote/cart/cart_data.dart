import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';

class CartData {
  DbFunctions crud;

  //New Cart list
  RxList<ProductModel> cart = <ProductModel>[].obs;
  GetStorage box = GetStorage();

  CartData(this.crud);

  addCart(String custid, String proid) async {
    var response = await crud.postData(AppLink.addCart, {
      "custid": custid,
      "proid": proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String custid, String proid) async {
    var response = await crud.postData(AppLink.removeCart, {
      "custid": custid,
      "proid": proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String custid) async {
    var response = await crud.postData(AppLink.cartView, {
      "custid": custid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCount(String custid, String proid) async {
    var response = await crud.postData(AppLink.geCount, {
      "custid": custid,
      "proid": proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String copName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "copname": copName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
