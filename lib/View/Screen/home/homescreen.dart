import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Home/homescreen_controller.dart';
import '../../../Core/Constant/color.dart';
import '../../Widget/home/customappbar.dart';
import '../../Widget/home/customnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: controller.currentPage == 0
            ? PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: CustomHomeAppBar(
                    custName: !controller.isSearch
                        ? 'Welcome ${controller.custName}'
                        : "",
                    favActive: true,
                    titleappbar: 'Find A Product',
                    onPressedAlert: () {},
                    onPressedFav: () {
                      Get.toNamed(AppRoute.myFavortie);
                    },
                    onChanged: (val) {
                      controller.chechSearch(val);
                      controller.isSearch == true;
                    },
                    searchController: controller.search!),
              )
            : null,
        endDrawer: !controller.isSearch ? const Drawer() : null,
        body: !controller.isSearch
            ? controller.listPage.elementAt(controller.currentPage)
            : SearchProduct(listDataModel: controller.listData),
        backgroundColor: AppColor.whiteColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColor.greyColor,
          ),
        ),
        bottomNavigationBar: const CustomNavBar(),
      ),
    );
  }
}

class SearchProduct extends GetView<HomeScreenControllerImp> {
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
