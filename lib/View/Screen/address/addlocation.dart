import 'package:ecommerce/Controller/address/addlocation_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddLocation extends StatelessWidget {
  const AddressAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressLocationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("add address"),
      ),
      body: Container(
        child: GetBuilder<AddressLocationControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                /*   if (controller.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GoogleMap(
                          markers: controller.markers.toSet(),
                          onTap: (latlong) {
                            controller.addMarker(latlong);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllergoogle) {
                            controller.controllerMap!
                                .complete(controllergoogle);
                          },
                        ),
                        Container(
                          color: AppColor.primaryColor,
                          child: MaterialButton(
                            minWidth: 200,
                            onPressed: () {},
                            child: Text("complete"),
                          ),
                        )
                      ],
                    ),
                  ), */
                Container(
                  color: AppColor.primaryColor,
                  child: MaterialButton(
                    minWidth: 200,
                    onPressed: () {
                      controller.goToPageAddLocationAddress();
                    },
                    child: Text("complete"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
