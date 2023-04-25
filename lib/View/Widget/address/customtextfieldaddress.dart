import 'package:flutter/material.dart';

class CustomTextFormFeildAddress extends StatelessWidget {
  final String hintText;
  final String labeText;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?) valid;
  final TextInputType? type;
  final bool? obscure;
  final void Function()? onTapIcon;
  const CustomTextFormFeildAddress(
      {super.key,
      required this.hintText,
      required this.labeText,
      required this.iconData,
      required this.myController,
      required this.valid,
      this.type,
      this.obscure,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType: type,
        validator: valid,
        obscureText: obscure == null || obscure == false ? false : true,
        controller: myController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeText)),
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: onTapIcon,
              child: obscure == false
                  ? const Icon(Icons.visibility)
                  : Icon(iconData),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
