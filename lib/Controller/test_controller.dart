import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Data/Source/Remote/test_data.dart';
import 'package:get/get.dart';
import '../Core/Functions/handlingdata.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testdata.getData();
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
