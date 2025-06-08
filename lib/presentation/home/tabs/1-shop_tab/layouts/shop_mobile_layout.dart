
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/data_layer/model/get_product_response/ProductsResponse.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/ViewModel/product_view_model__cubit.dart';


import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/widgets/VerItemWidget.dart';
import '../../../../../core/resuable_component/error_message.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';
import '../widgets/product_container.dart';


class ShopMobileLayout extends StatelessWidget {
  const ShopMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding:   EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => getIt<ProductViewModelCubit>()..getProducts(),
        child: Scaffold(
          backgroundColor: ColorManager.primaryColor,
          floatingActionButton: SpeedDial(
            backgroundColor: ColorManager.secondaryColor,
            icon: Icons.menu,
            activeIcon: Icons.close,
            children: [
              SpeedDialChild(
                child: Icon(Icons.add_shopping_cart,),
                label: 'Cart',
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.cartScreen);
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.receipt_long),
                label: 'Orders',
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.ordersScreen); // لازم تكون عامل الـ route ده
                },
              ),
            ],
          ),

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.fill
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 13),
                TextWidget( text:StringsManager.shop,),
            BlocBuilder<ProductViewModelCubit,ProductViewModelState>(
                builder:  (context, state) {
                  if(state is ProductViewModelError){
                    return ErrorWidgett( onPressed: () {
                      final cubit = ProductViewModelCubit.get(context);
                      cubit..getProducts();
                    },message: state.err);
                  }
                  else if(state is ProductViewModelSuccess){
            List<ProductsResponse> products=state.products;
            return Expanded(
              child: ListView.separated(
                itemBuilder:  (context, index) => ProductContainer(model: products[index],),
                separatorBuilder: (context, index) =>
                    Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,

                      ),

                    ),
                itemCount: products.length,
              ),
            );
                  }
                  else if (state is ProductViewModelLoading){
                    return Center(child: LoadingCircle());
                  }
                  return Center(child: LoadingCircle());
                },
            )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
