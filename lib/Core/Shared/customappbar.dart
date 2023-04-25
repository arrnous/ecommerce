import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant/color.dart';

class CustomAppBar extends GetView {
  final void Function() onPressedAlert;
  final void Function()? onPressedFav;
  final void Function()? onPressedSearch;
  final bool favActive;
  final void Function(String) onChanged;
  final TextEditingController? searchController;
  final String? title;

  @override
  //Size get preferredSize => const Size.fromHeight(110);
  const CustomAppBar({
    super.key,
    this.title,
    this.searchController,
    required this.onChanged,
    required this.favActive,
    required this.onPressedAlert,
    this.onPressedSearch,
    this.onPressedFav,
  });

  get preferredSize => 60;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toString(),
        style: const TextStyle(
            color: AppColor.greyColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColor.whiteColor,
      iconTheme: const IconThemeData(color: AppColor.black),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: onChanged,
                      controller: searchController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          prefixIcon: IconButton(
                              onPressed: onPressedSearch,
                              icon: const Icon(Icons.search)),
                          hintText: "Find Product",
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey[200]),
                    ),
                  ),
                  favActive == true
                      ? Row(
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: IconButton(
                                onPressed: onPressedFav,
                                icon: const Icon(Icons.favorite_border_outlined,
                                    size: 24),
                              ),
                            ),
                          ],
                        )
                      : const Text("")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
