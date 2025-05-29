/*

import 'package:flutter/material.dart';
import 'package:ill_vent/data_layer/model/cart/CartResponse.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view/widget/product_cart_widget.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view_model/cart_view_model_cubit.dart';

class ProductCartBuilder extends StatelessWidget {
  final CartResponse cartResponse;
  const ProductCartBuilder({super.key, required this.cartResponse});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            //
           },
          child: ProductCartWidget(
            onTapDeleted: () {
   CartViewModelCubit.get(context).doIntent(RemoveFromCartIntent(
                  productId:
                  cartResponse.cart?.cartItems?[index].product?.id ??
                      ""));

            },
            price: cartResponse.cart?.cartItems?[index].price ?? 0,
            quantity: cartResponse.cart?.cartItems?[index].quantity ?? 0,
            productId:
            cartResponse.cart?.cartItems?[index].product?.id ?? "",
            priceAfterDiscount: cartResponse
                .cart?.cartItems?[index].product?.priceAfterDiscount ??
                0,
            imgCover:
            cartResponse.cart?.cartItems?[index].product?.imgCover ??
                "",
            title:
            cartResponse.cart?.cartItems?[index].product?.title ?? "",
            discription:
            cartResponse.cart?.cartItems?[index].product?.description ??
                "",
            onUpdateQuantity: (String productId, num quantity) {
  CartCubit.get(context).doIntent(UpdateProductQuantityIntent(
                productId: productId,
                quantity: quantity.toInt(),
              ));
              toastMessage(
                  message: AppStrings.quantityUpdated,
                  tybeMessage: TybeMessage.positive);

            },
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: cartResponse.cart?.cartItems?.length ?? 0);
  }
}
*/
