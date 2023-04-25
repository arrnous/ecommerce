import 'package:ecommerce/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndQty extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String price;
  final String count;

  const PriceAndQty(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
                child: Text(
              count,
              style: const TextStyle(fontSize: 20),
            )),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove))
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              price,
              style: const TextStyle(
                  fontSize: 20, height: 1.1, color: AppColor.tomatoRed),
            ),
          ],
        )
      ],
    );
  }
}
