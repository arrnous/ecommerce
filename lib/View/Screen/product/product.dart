import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Controller/favorite/favorite_controller.dart';
import 'package:ecommerce/Controller/product/product_controller.dart';
import 'package:ecommerce/Core/Class/handlingdataview.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/Core/Shared/customappbar.dart';
import 'package:ecommerce/View/Widget/product/customprolist.dart';
import 'package:ecommerce/View/Widget/product/listcat.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    FavoriteControllerImp controllerfav = Get.put(FavoriteControllerImp());
    //  Get.lazyPut(() => FavoriteControllerImp());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: "",
          favActive: false,
          onPressedFav: () {},
          onChanged: (val) {
            controller.isSearch = true;
            controller.chechSearch(val);
          },
          searchController: controller.search!,
          onPressedAlert: () {},
        ),
      ),
      body: GetBuilder<ProductControllerImp>(
          builder: (controller) => !controller.isSearch
              ? ListView(
                  //  physics: NeverScrollableScrollPhysics(),
                  children: [
                    const CategoryListPro(),
                    HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            controllerfav.isFavorite[controller.data[index]
                                    ['pro_id']] =
                                controller.data[index]['favorite'];
                            return CustomProList(
                                productModel: ProductModel.fromJson(
                                    controller.data[index]));
                          }),
                    )
                  ],
                )
              // New Cart == old cart => listdata
              : SearchProduct(listDataModel: controller.cart)),
    );
  }
}

class SearchProduct extends GetView<ProductControllerImp> {
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
