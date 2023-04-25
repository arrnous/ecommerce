import 'package:ecommerce/Core/Services/services.dart';
import 'package:get/get.dart';

translateDB(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedprefs.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
