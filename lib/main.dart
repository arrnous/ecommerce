import 'package:ecommerce/Core/Localization/changelang.dart';
import 'package:ecommerce/Core/Services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Core/Localization/translation.dart';
import 'View/Screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Onboarding(),
      routes: routes,
    );
  }
}
