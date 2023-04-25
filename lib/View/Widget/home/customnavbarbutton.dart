import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class CustomNavBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonName;
  final IconData icon;
  //final Color color;
  final bool active;
  CustomNavBarButton(
      {super.key,
      required this.onPressed,
      required this.buttonName,
      required this.icon,
      required this.active
      //required this.color,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  active == true ? AppColor.primaryColor : AppColor.greyColor,
            ),
            /*  Text(
              buttonName,
              style: TextStyle(
                  color: active == true ? AppColor.primaryColor : AppColor.grey),
            ) */
          ],
        ),
      ),
    );
  }
}
