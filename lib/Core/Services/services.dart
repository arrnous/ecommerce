import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedprefs;

  Future<MyServices> init() async {
    sharedprefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
