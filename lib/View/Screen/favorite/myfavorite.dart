import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/favorite/favorite_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Shared/customappbar.dart';
import '../../Widget/favorite/customfavlist.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controller = Get.put(FavoriteControllerImp());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          favActive: false,
          onChanged: (val) {
            controller.isSearch == true;
            controller.chechSearch(val);
          },
          searchController: controller.search!,
          onPressedAlert: () {},
        ),
      ),
      body: Container(
        child: GetBuilder<FavoriteControllerImp>(
            builder: (controller) => !controller.isSearch
                ? ListView(
                    children: [
                      const SizedBox(height: 20),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8807),
                            itemBuilder: (context, index) {
                              return CustomFavoriteList(
                                myFavoriteModel: controller.data[index],
                              );
                            },
                          )),
                    ],
                  )
                : SearchProduct(listDataModel: controller.listData)),
      ),
    );
  }
}

class SearchProduct extends GetView<FavoriteControllerImp> {
  final List<ProductModel> listDataModel;
  const SearchProduct({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductPage(listDataModel[index]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Card(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagePro}/${listDataModel[index].proImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            "${listDataModel[index].proName}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("${listDataModel[index].catName}"),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
