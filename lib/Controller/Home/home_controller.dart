import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/Data/Source/Remote/home/homedata.dart';
import 'package:ecommerce/Data/Source/Remote/search/searchdata.dart';
import 'package:get/get.dart';
import '../../Core/Functions/handlingdata.dart';

abstract class HomeController extends GetxController {
  inisialData();
  getData();
  goToProduct();
  goToCategory(List category, int selectedCat, String catId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? lang;
  String? id;

  HomeData homeData = HomeData(Get.find());
  SearchData searchData = SearchData(Get.find());

  // List data = [];
  List category = [];
  List product = [];
  // List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  String? username;

  @override
  inisialData() {
    username = myServices.sharedprefs.getString("username");
    id = myServices.sharedprefs.getString("id");
    lang = myServices.sharedprefs.getString("lang");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("================" + response.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        category.addAll(response['category']['data']);
        product.addAll(response['product']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProduct() {
    Get.toNamed(AppRoute.product, arguments: {});
  }

  @override
  goToCategory(category, selectedCat, catId) {
    Get.toNamed(AppRoute.product, arguments: {
      "category": category,
      "selectedcat": selectedCat,
      "catid": catId
    });
  }

  @override
  void onInit() {
    inisialData();
    getData();
    super.onInit();
  }
}
