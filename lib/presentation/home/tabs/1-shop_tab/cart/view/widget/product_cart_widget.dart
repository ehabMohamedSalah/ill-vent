import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:skeletonizer/skeletonizer.dart';


class ProductCartWidget extends StatefulWidget {
  final String? title;
  final String? imgCover;
  final String? discription;
  final String? productId;
  final num? quantity;
  final num? price;
  final num? priceAfterDiscount;
  final String? cartItemId;
  final Function(String cartItemId) onTapDeleted;
  final Function(String productId, num quantity) onUpdateQuantity;

  const ProductCartWidget({
    super.key,
    this.title,
    this.imgCover,
    this.price,
    this.priceAfterDiscount,
    required this.onTapDeleted,
    this.discription,
    required this.onUpdateQuantity,
    this.productId,
    this.quantity,
    this.cartItemId,
  });

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  late num unitPrice;
  late num quantity;

  @override
  void initState() {
    super.initState();
    unitPrice = widget.priceAfterDiscount ?? widget.price ?? 0;
    quantity = widget.quantity ?? 1;
  }

  num get totalPrice => unitPrice * quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // spacing مش موجودة في Row، لو عايز مسافة استخدم SizedBox
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 120,
                imageUrl: widget.imgCover ?? "",
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Skeletonizer(
                      enabled: true,
                      child: Container(
                        color: const Color.fromARGB(131, 158, 158, 158),
                      ),
                    ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 8), // فراغ بين الصورة والعمود
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.cartItemId != null && widget.cartItemId!.isNotEmpty) {
                          widget.onTapDeleted(widget.cartItemId!);
                        }
                      },
                      icon: const Icon(Icons.delete_outline_outlined,
                          color: Colors.red),
                    ),
                  ],
                ),
                Text(
                  widget.discription ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "EGP $totalPrice",
                      overflow: TextOverflow.ellipsis,
                      style: Appstyle.small15(context).copyWith(color: Colors.black),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          final newQuantity = quantity - 1;
                          setState(() {
                            quantity = newQuantity;
                          });
                          if (widget.productId != null && widget.productId!.isNotEmpty) {
                            widget.onUpdateQuantity(widget.productId!, newQuantity);
                          }
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text("$quantity", style: Theme.of(context).textTheme.bodyMedium),
                    IconButton(
                      onPressed: () {
                        final newQuantity = quantity + 1;
                        setState(() {
                          quantity = newQuantity;
                        });
                        if (widget.productId != null && widget.productId!.isNotEmpty) {
                          widget.onUpdateQuantity(widget.productId!, newQuantity);
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
