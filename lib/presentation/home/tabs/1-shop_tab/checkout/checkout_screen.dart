import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/error_message.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/data_layer/model/dataclasses/chekout_model.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/checkout/view_model/chechkout_viewmodel_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../../core/resuable_component/custom_button.dart';
import '../../../../../core/resuable_component/toast_message.dart';

class CheckoutScreen extends StatefulWidget {
  List<int> cartItemId;
  final String total;
  CheckoutScreen(this.total,this.cartItemId);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}



late TextEditingController nameController;
late TextEditingController phoneContrller;
late TextEditingController addressController;
late TextEditingController noteController;
String? selectedPaymentMethod;

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneContrller = TextEditingController();
    addressController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        title: Text("Checkout",style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined,color: ColorManager.secondaryColor,)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => getIt<CheckoutViewmodelCubit>(),
              child: Column(
                children: [
                  CustomFormField(
                    checkout:true,
                    filledColor: true,
                    maxLength: 50,
                    title: "Name",
                    controller: nameController,
                    hintText: "Ehab",
                    keyboard: TextInputType.name,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter a name";
                      }
                      final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
                      if (!nameRegExp.hasMatch(value.trim())) {
                        return "Name must contain only letters";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    checkout:true,
                    filledColor: true,
                    maxLength: 50,
                    title: "Phone Number",
                    controller: phoneContrller,
                    hintText: "01143668719",
                    keyboard: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter a phone number";
                      }
                      final phoneRegExp = RegExp(r'^(01)[0-9]{9}$');
                      if (!phoneRegExp.hasMatch(value.trim())) {
                        return "Enter a valid Egyptian phone number";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    checkout:true,
                    filledColor: true,
                    maxLength: 50,
                    title: "Address",
                    controller: addressController,
                    hintText: "1222 maraag al maadi",
                    keyboard: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    checkout:true,
                     filledColor: true,
                    maxLength: 50,
                    title: "Note",
                    controller: noteController,
                    hintText: "Additional notes (optional)",
                    keyboard: TextInputType.text,
                    validator: (value) {
                      // Note can be empty, so no validation error
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                    DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: ColorManager.secondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    value: selectedPaymentMethod,
                    items: ['Cash', 'Card'].map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a payment method';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h,),

                  // Display total with styling
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total: ",
                          style: Appstyle.small20(context).copyWith(
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${widget.total}",
                          style: Appstyle.small20(context).copyWith(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                  BlocConsumer<CheckoutViewmodelCubit,ChechkoutViewmodelState>(
                    builder:(context, state) {
                      if(state is ChechkoutViewmodelLoading)return Center(child: LoadingCircle(),);
                      else if(state is ChechkoutViewmodelError)return Center(child: ErrorWidgett(
                        message:   state.err.toString(),
                        onPressed:  () async{
                          if (_formKey.currentState!.validate()) {
                            if (selectedPaymentMethod == 'Cash') {
                              CheckoutViewmodelCubit.get(context).checkout(
                                CheckoutModel(
                                  cartItemIds: widget.cartItemId,
                                  createOrder: true,
                                  paymentMethod: "Cash",
                                  shippingAddress: addressController.text,
                                ),
                              );
                            } else {
                              final cubit = CheckoutViewmodelCubit.get(context);
                              final response = await cubit.checkout(
                                CheckoutModel(
                                  cartItemIds: widget.cartItemId,
                                  createOrder: true,
                                  paymentMethod: "Card", // Visa = card
                                  shippingAddress: addressController.text,
                                ),
                              );

                              if (response != null && response.isNotEmpty) {
                                final url = response; // Expected to be checkoutUrl
                                final uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                  toastMessage(
                                    message: "Payment Completed!",
                                    tybeMessage: TybeMessage.positive,
                                  );
                                  // بعد الرجوع من صفحة الدفع
                                  Navigator.pushReplacementNamed(context, RouteManager.homeScreenRoutes);

                                } else {
                                  toastMessage(
                                    message: "Could not launch payment page",
                                    tybeMessage: TybeMessage.negative,
                                  );
                                }
                              } else {
                                toastMessage(
                                  message: "Failed to initiate payment",
                                  tybeMessage: TybeMessage.negative,
                                );
                              }
                            }
                          }

                        },),);
                      return CustomButton(() async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedPaymentMethod == 'Cash') {
                            CheckoutViewmodelCubit.get(context).checkout(
                              CheckoutModel(
                                cartItemIds: widget.cartItemId,
                                createOrder: true,
                                paymentMethod: "Cash",
                                shippingAddress: addressController.text,
                              ),
                            );
                          } else {
                            final cubit = CheckoutViewmodelCubit.get(context);
                            final response = await cubit.checkout(
                              CheckoutModel(
                                cartItemIds: widget.cartItemId,
                                createOrder: true,
                                paymentMethod: "Card", // Visa = card
                                shippingAddress: addressController.text,
                              ),
                            );

                            if (response != null && response.isNotEmpty) {
                              final url = response; // Expected to be checkoutUrl
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                                toastMessage(
                                  message: "Payment Completed!",
                                  tybeMessage: TybeMessage.positive,
                                );
                                // بعد الرجوع من صفحة الدفع
                                Navigator.pushReplacementNamed(context, RouteManager.homeScreenRoutes);

                              } else {
                                toastMessage(
                                  message: "Could not launch payment page",
                                  tybeMessage: TybeMessage.negative,
                                );
                              }
                            } else {
                              toastMessage(
                                message: "Failed to initiate payment",
                                tybeMessage: TybeMessage.negative,
                              );
                            }
                          }
                        }
                      }, "Confirm Order");

                    } ,
                    listener:(context, state) {
                      FocusScope.of(context).unfocus();
                      if(state is ChechkoutViewmodelSuccess){
                       Navigator.pushNamed(context,  RouteManager.homeScreenRoutes,);
                       toastMessage(
                           message: "Order Successful!",
                           tybeMessage: TybeMessage.positive
                       );

                     }
                    } ,

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
