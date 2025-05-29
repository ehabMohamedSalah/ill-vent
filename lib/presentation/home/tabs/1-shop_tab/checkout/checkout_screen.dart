import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../../core/resuable_component/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  final String total;
  CheckoutScreen(this.total);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

final _formKey = GlobalKey<FormState>();

late TextEditingController nameController;
late TextEditingController phoneContrller;
late TextEditingController addressController;
late TextEditingController noteController;

class _CheckoutScreenState extends State<CheckoutScreen> {
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
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormField(
                  filledColor: true,
                  maxLength: 50,
                  title: "Name",
                  controller: nameController,
                  hintText: "Ehab",
                  keyboard: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid name";
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  filledColor: true,
                  maxLength: 50,
                  title: "Phone Number",
                  controller: phoneContrller,
                  hintText: "01143668719",
                  keyboard: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
                CustomFormField(
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
                CustomButton(() {
                  if (_formKey.currentState!.validate()) {
                    // Confirm order action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order Confirmed! Total: \$${widget.total}')),
                    );
                  }
                }, "Confirm Order")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
