 import 'package:flutter/material.dart';

class OrderSummaryWidget extends StatelessWidget {
  final double subTotal;
  const OrderSummaryWidget({super.key, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    double deliveryPrice = 10;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        children: [
          Text("Sub Total",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.grey,
              )),
          const Spacer(),
          Text("$subTotal\$",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.grey,
              )),
        ],
      ),
      Row(
        children: [
          Text("Delivery Fees",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.grey,
              )),
          const Spacer(),
          const Text("10\$",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey,
              )),
        ],
      ),
      const Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      Row(
        children: [
          Text(
            "Total",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            "${subTotal + deliveryPrice}\$",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      )
    ]);
  }
}
