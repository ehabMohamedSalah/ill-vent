import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/custom_button.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/ViewModel/product_view_model__cubit.dart';

import '../../../../../core/resuable_component/loading_circle.dart' show LoadingCircle;
import '../../../../../core/resuable_component/rating_dialog.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../cart/view_model/cart_view_model_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  String productId;
  ProductDetailsScreen(this.productId);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
 int quantity=1;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductViewModelCubit>()..getProductById(productId: widget.productId),
        ),
        BlocProvider(
          create: (context) => getIt<CartViewModelCubit>(), // ✅ Inject cart cubit
        ),
      ],
      child: BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
        builder: (context, state) {
          if (state is ProductByIdViewModelSuccess) {
            var product = state.product;
            double rating = (product!.rating ?? 0).toDouble();

            return Scaffold(
              backgroundColor: ColorManager.primaryColor,
              appBar: AppBar(
                backgroundColor: ColorManager.secondaryColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorManager.white,
                  ),
                ),
                centerTitle: true,
                title: Column(
                  children: [
                    Text(
                      product.name ?? "",
                      style: TextStyle(
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  image:
                    DecorationImage(image: AssetImage(
                      "assets/images/background.png",
                    ),
                    fit: BoxFit.fill)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 180.h,
                          width: 180.w,
                          child: CachedNetworkImage(
                            imageUrl: product.imageUrl ?? "",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: Icon(Icons.image_not_supported,
                                  size: 40, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            child: RatingStars(
                              rating: rating,
                              starSize: 30.0,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Description : ",style: Appstyle.small20(context).copyWith(color: Colors.black),)),
                      Text(product.description??"",maxLines: 5,style: Appstyle.small20(context).copyWith(color: Colors.black54,),),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                        [
                          Text("Qty :",style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),
                          Padding(
                            padding:   EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black,width: 2)

                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, color: ColorManager.secondaryColor),
                                    onPressed: () {
                                      if (quantity > 1 ) {
                                        quantity--;
                                        setState(() {

                                        });
                                      }
                                    },
                                  ),
                                  Text("${quantity}",style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),
                                  IconButton(
                                    icon: Icon(Icons.add, color: ColorManager.secondaryColor),
                                    onPressed: () {
                                      if (quantity < (product.stockQuantity ?? 999)) {
                                        setState(() {
                                          quantity++;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],),

                      Spacer(),
                      BlocConsumer<CartViewModelCubit,CartViewModelState>(
                          builder:  (context, state) {
                            return    CustomButton(
                                    (){
                                  final cartCubit = CartViewModelCubit.get(context);
                                  cartCubit.addToCart(
                                    productId: "${product.productId}" ,
                                    quantity: quantity.toString(),
                                  );

                                }
                                ,
                                "Add To Cart"
                            );
                          },
                          listener:  (context, state) {
                            if(state is AddToCartViewModelSuccess){
                          Navigator.pop(context);
                              toastMessage(
                                  message: "Added Successful",
                                  tybeMessage: TybeMessage.positive
                              );
                            }else if (state is AddToCartViewModelError) {
                              toastMessage(
                                  message: state.err,
                                  tybeMessage: TybeMessage.negative
                              );
                            }
                          },
                      ),

                    ],
                  ),
                ),
              ),
            );
          } else if (state is ProductByIdViewModelError) {
            return Center(child: Text(state.err));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.secondaryColor,
              leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
            ),
              body:  Container(
                  decoration: BoxDecoration(
                      image:
                      DecorationImage(image: AssetImage(
                        "assets/images/background.png",
                      ),
                          fit: BoxFit.fill)
                  ),
                  child: LoadingCircle()),);
        },
      ),
    );
  }
}
