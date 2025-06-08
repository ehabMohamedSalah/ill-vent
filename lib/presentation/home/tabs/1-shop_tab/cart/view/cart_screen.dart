import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/custom_button.dart';
import 'package:ill_vent/core/resuable_component/error_message.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view/widget/product_cart_widget.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view_model/cart_view_model_cubit.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view_model/delete_item_cart_view_model/delete_item_view_model_cubit.dart';
import '../../../../../../core/resuable_component/toast_message.dart';
import '../../checkout/checkout_screen.dart';
import '../view_model/update_cart_view_model/update_cart_view_model_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
List<int> ?allCartItemIds;
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartViewModelCubit>()..getCart()),
        BlocProvider(create: (context) => getIt<UpdateCartViewModelCubit>()),
        BlocProvider(create: (context) => getIt<DeleteItemViewModelCubit>()),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          backgroundColor: ColorManager.secondaryColor,
          title: Text(
            "Cart",
            style: Appstyle.medium25(context).copyWith(color: ColorManager.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: ColorManager.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image:
            AssetImage(
              "assets/images/background.png",
            ),
              fit: BoxFit.fill
            ),
          ),
          child: BlocConsumer<CartViewModelCubit, CartViewModelState>(
            builder: (context, state) {
              if (state is GetCartViewModelSuccess) {
                var products = state.listProducts;
                var total = state.total;

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          var product = products[index];
                        allCartItemIds = products.map((e) => e.cartItemId!.toInt()).toList();
                          return ProductCartWidget(
                            onTapDeleted: (String cartItemId) {
                              DeleteItemViewModelCubit.get(context).deleteCartItem(cartItemId: cartItemId);
                              CartViewModelCubit.get(context).removeItemFromCartLocally(cartItemId);

                              toastMessage(
                                message: "Item Deleted",
                                tybeMessage: TybeMessage.positive,
                              );
                            },
                            onUpdateQuantity: (productId, quantity) {
                              UpdateCartViewModelCubit.get(context).updateCart(
                                productId: product.cartItemId.toString(),
                                quantity: quantity.toString(),
                              );

                              CartViewModelCubit.get(context).updateQuantityLocally(
                                cartItemId: product.cartItemId.toString(),
                                newQuantity: quantity.toInt(),
                              );

                              toastMessage(
                                message: "Quantity Updated",
                                tybeMessage: TybeMessage.positive,
                              );
                            },
                            title: product.productName,
                            imgCover: product.productImage,
                            productId: "${product.productId}",
                            price: product.productPrice,
                            quantity: product.quantity,
                            cartItemId: product.cartItemId.toString(),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(color: ColorManager.primaryColor, height: 10.h);
                        },
                        itemCount: products!.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text("Total: \$${total.toStringAsFixed(2)}",
                            style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
                          ),
                          SizedBox(height: 10.h),
                          CustomButton(() {
                            // Uncomment when checkout is ready
                            (total==0)?   toastMessage(
                            message: "Please Add At Least One Product",
                            tybeMessage: TybeMessage.negative,
                            ):Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(
                              " ${total}",allCartItemIds??[])));
                          }, "CheckOut"),
                        ],
                      ),
                    ),
                  ],
                );
              }
              else if (state is GetCartViewModelError) {
                return Center(child: ErrorWidgett
                  (
                    message: state.err,
                    onPressed:  () {
                      getIt<CartViewModelCubit>()..getCart();
                    },
                ));
              }
              return LoadingCircle();
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}
