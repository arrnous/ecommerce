import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Constant/color.dart';
import 'package:ecommerce/Data/Model/productmodel.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constant/imageAsset.dart';
import '../../../linkapi.dart';

class CustomCartList extends StatelessWidget {
  //final ProductModel productModel;
  final String name;
  final String price;
  final String count;
  final String imageName;
  final void Function() onAdd;
  final void Function() onRemove;

  const CustomCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Card(
            //clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.imagePro}/$imageName",
                      height: 90,
                      fit: BoxFit.fill,
                    )),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(
                        name,
                        style: const TextStyle(
                            color: AppColor.black, fontSize: 18),
                      ),
                      subtitle: Text(
                        price,
                        style: const TextStyle(
                            color: AppColor.tomatoRed, fontSize: 15),
                      ),
                    )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 30,
                        child: IconButton(
                            splashColor: Colors.transparent,
                            onPressed: onAdd,
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.greyColor,
                            ))),
                    SizedBox(
                      height: 18,
                      child: Text(
                        count,
                        style: const TextStyle(),
                      ),
                    ),
                    SizedBox(
                        height: 40,
                        child: IconButton(
                            splashColor: Colors.transparent,
                            onPressed: onRemove,
                            icon: const Icon(
                              Icons.remove,
                              color: AppColor.greyColor,
                            ))),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
