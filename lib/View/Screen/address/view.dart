import 'package:ecommerce/Controller/address/addview_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Core/Shared/customtitleappbar.dart';
import 'package:ecommerce/Data/Model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewControllerImp controller = Get.put(AddressViewControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomTitleAppBar(
          title: "Address",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAddLocation);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onRemove: () {
                    controller.remvoeAddress(controller.data[index].addId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onRemove;
  const CardAddress(
      {super.key, required this.addressModel, required this.onRemove});

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          title: Text("${addressModel.addName}"),
          subtitle: Text(
              "City :  ${addressModel.addCity}\n Street : ${addressModel.addStreet}"),
          trailing: IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.delete_outline,
                color: AppColor.tomatoRed,
              )),
        ),
      ),
    );
  }
}
