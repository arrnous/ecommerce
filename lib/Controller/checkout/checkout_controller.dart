import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Functions/handlingdata.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Model/addressmodel.dart';
import 'package:ecommerce/Data/Source/Remote/address/address_data.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String val);
  chooseOrderType(String val);
  chooseAddress(String val);
  getAddress();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? orderType;
  String? addressId;

  @override
  choosePaymentMethod(val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseOrderType(val) {
    orderType = val;
    update();
  }

  @override
  chooseAddress(val) {
    addressId = val;
    update();
  }

  @override
  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.getData(myServices.sharedprefs.getString("id")!);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  getData() async {}

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
