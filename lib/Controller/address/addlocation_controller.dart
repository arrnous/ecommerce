import 'dart:async';

import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddressLocationController extends GetxController {
  getCurrentLocation();
}

class AddressLocationControllerImp extends AddressLocationController {
  StatusRequest statusRequest = StatusRequest.loading;

  Position? position;

  List<Marker> markers = [];

  Completer<GoogleMapController>? controllerMap;
  CameraPosition? kGooglePlex;

  double? lat;
  double? long;

  addMarker(lalong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("id"), position: lalong));
    lat = lalong.latitude;
    long = lalong.longitude;
    update();
  }

  goToPageAddLocationAddress() {
    Get.toNamed(AppRoute.addressAdd, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  @override
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    controllerMap = Completer<GoogleMapController>();
    getCurrentLocation();
    super.onInit();
  }
}
