import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/checkout/view_model/chechkout_viewmodel_cubit.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/checkout/view_model/delete_viewmodel/delete_view_model_cubit.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resuable_component/error_message.dart';
import '../../../../../core/resuable_component/loading_circle.dart';
import '../../../../../core/resuable_component/toast_message.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = getIt<CheckoutViewmodelCubit>()..getOrder();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => getIt<DeleteViewModelCubit>(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.png" ),
          fit: BoxFit.fill
          )
        ),
        child: BlocConsumer<DeleteViewModelCubit, DeleteViewModelState>(
          listener: (context, deleteState) {
            if (deleteState is DeleteOrderViewmodelSuccess) {
              if (context.mounted) {
                toastMessage(
                    message: "Order Deleted Successfully!",
                    tybeMessage: TybeMessage.positive
                );

              }
              // بعد الحذف نحدث الطلبات
              context.read<CheckoutViewmodelCubit>().getOrder();
            } else if (deleteState is DeleteOrderViewmodelError) {
              if (context.mounted) {

                toastMessage(
                    message: "Error: ${deleteState.err}",
                    tybeMessage: TybeMessage.negative
                );
              }
            }
          },
          builder: (context, deleteState) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/background.png" ),
                      fit: BoxFit.fill
                  )
              ),
              child: BlocBuilder<CheckoutViewmodelCubit, ChechkoutViewmodelState>(
                builder: (context, state) {
                  if (state is GetorderViewmodelError) {
                    return Scaffold(
                      backgroundColor: ColorManager.primaryColor,
appBar: AppBar(
  backgroundColor: ColorManager.secondaryColor,
  leading: Icon(Icons.arrow_back_ios_new_outlined,color: ColorManager.secondaryColor,),
),
                      body: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/background.png" ),
                                fit: BoxFit.fill
                            )
                        ),
                        child: ErrorWidgett(
                          message: state.err,
                          onPressed: () {
                            context.read<CheckoutViewmodelCubit>().getOrder();
                          },
                        ),
                      ),
                    );
                  }
                  if (state is GetorderViewmodelSuccess) {
                    var orders = (state.response ?? []).where((order) => order.orderStatus != "Cancelled").toList();
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: ColorManager.secondaryColor,
                        leading: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: ColorManager.white,
                          ),
                        ),
                        centerTitle: true,
                        title: Text(
                          "Orders",
                          style: Appstyle.small20(context)
                              .copyWith(color: ColorManager.white),
                        ),
                      ),
                      body: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/background.png" ),
                                fit: BoxFit.fill
                            )
                        ),
                        child: orders.isNotEmpty
                            ? ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return Slidable(
                              key: ValueKey(order.orderId),
                              endActionPane: ActionPane(
                                motion: DrawerMotion(),
                                extentRatio: 0.25,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context
                                          .read<DeleteViewModelCubit>()
                                          .deleteOrder(orderId: order.orderId.toString());
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: buildOrderCard(context, order),
                            );
                          },
                        )
                            : Center(
                          child: Text(
                            "You haven’t booked anything yet!",
                            style: Appstyle.small20(context)
                                .copyWith(color: ColorManager.secondaryColor),
                          ),
                        ),
                      ),
                    );
                  }
                  return Scaffold(
                      backgroundColor: ColorManager.primaryColor,
                            appBar: AppBar(
                              backgroundColor: ColorManager.secondaryColor,
                              leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
                            ),
                      body: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/background.png" ),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: LoadingCircle()));
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildOrderCard(BuildContext context, order) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${order.orderId}',
              style: Appstyle.small20(context).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Address: ${order.shippingAddress}'),
            Text('Payment: ${order.paymentMethod}'),
            Text('Status: ${order.orderStatus}'),
            Text('Total: ${order.totalAmount} EGP'),
            SizedBox(height: 12),
            Divider(color: Colors.grey),
            ...order.orderItems!.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.productImage ?? '',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productName ?? "",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text('Qty: ${item.quantity}'),
                          Text('Total: ${item.totalPrice} EGP'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
