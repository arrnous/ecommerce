import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String hintText;
  final String labeText;
  final IconData iconData;
  final TextEditingController? myController;
  const CustomTextFormFeild(
      {super.key,
      required this.hintText,
      required this.labeText,
      required this.iconData,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
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
            suffixIcon: Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
