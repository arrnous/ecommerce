import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Functions/handlingdata.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Model/addressmodel.dart';
import 'package:ecommerce/Data/Source/Remote/address/address_data.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  viewAddress();
  remvoeAddress(String addId);
}

class AddressViewControllerImp extends AddressViewController {
  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.getData(myServices.sharedprefs.getString("id")!);
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        /*   if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        } */
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  remvoeAddress(addId) {
    addressData.removeData(addId);
    data.removeWhere((element) => element.addId == addId);
    update();
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }
}
