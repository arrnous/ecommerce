import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Shared/custombutton.dart';
import 'package:ecommerce/Core/Shared/customtitleappbar.dart';
import 'package:ecommerce/View/Widget/address/customtextfieldaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/address/add_controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomTitleAppBar(
            title: "ADD Location",
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                SizedBox(height: 20),
                CustomTextFormFeildAddress(
                  hintText: "name",
                  labeText: "name",
                  iconData: Icons.location_history_sharp,
                  myController: controller.name,
                  valid: (val) {},
                ),
                CustomTextFormFeildAddress(
                  hintText: "city",
                  labeText: "city",
                  iconData: Icons.location_on_outlined,
                  myController: controller.city,
                  valid: (val) {},
                ),
                CustomTextFormFeildAddress(
                  hintText: "street",
                  labeText: "street",
                  iconData: Icons.edit_road_sharp,
                  myController: controller.street,
                  valid: (val) {},
                ),
                CustomButton(
                  text: "Add",
                  onPressed: () {
                    controller.addAddress();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
