import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:ill_vent/core/resuable_component/toast_message.dart';
 import '../../../../core/di/di.dart';
import '../../../../core/resuable_component/image_picker_widget.dart';
import '../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../core/utils/Appstyle.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../Scan_Patient/scan_screen.dart';
import '../resuable_component/Custom_textfield.dart';
import '../view_model/emergency_view_model_cubit.dart';


class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late TextEditingController commentController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              ImagePickerWidget(
                onImagePicked: (File image) {
                  setState(() {
                    pickedImage = image;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildTitleText(),
              SizedBox(height: 20),
              _buildDivider(),
              SizedBox(height: 30),
              CustomHomeTextfield(
                controller: commentController,
                suffixIcon: Icon(Icons.local_hospital, color: ColorManager.secondaryColor),
                labelText: "Write a Comment For the Situation",
                hintText: "Write a Comment For a Situation....",
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                 /* if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;*/
                },
              ),
              SizedBox(height: 20.h),
              _buildNextButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Center(
      child: Text(
        "Take a Photo for \n the accident",
        style: Appstyle.large30(context).copyWith(
          color: ColorManager.secondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "OR",
            style: Appstyle.small15(context).copyWith(
              color: ColorManager.secondaryColor,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.white)),
      ],
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      onTap: () async {
        if (formKey.currentState?.validate() ?? false) {
          String? base64Image;

          if (pickedImage != null) {
            final bytes = await pickedImage!.readAsBytes();
            base64Image = base64Encode(bytes);
          }

          if (pickedImage == null) {
            // إظهار رسالة تنبيه للمستخدم
            toastMessage(
                message: "No photo of the incident was captured; proceeding without a photo.",
                tybeMessage: TybeMessage.negative
            );

          }


          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => getIt<EmergencyViewModelCubit>(),
                child: ScanScreen(commentController.text??"", pickedImage.toString()??""),
              ),
            ),
          );


        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Next',
            style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
          ),
          Icon(Icons.arrow_forward_ios, color: ColorManager.secondaryColor, size: 20),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
