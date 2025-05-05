import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/resuable_component/id_CustomField.dart';
import '../../../../../core/resuable_component/image_picker_widget.dart';
import '../../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';

class PhotoMobileLayout extends StatefulWidget {
  @override
  _PhotoMobileLayoutState createState() => _PhotoMobileLayoutState();
}

class _PhotoMobileLayoutState extends State<PhotoMobileLayout> {
  late TextEditingController comment;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    comment = TextEditingController();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: CustomAppBar(navigatorScreen: RouteManager.scanScreen),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              ImagePickerWidget(
                onImagePicked: (File image) {
                  // Handle image picked (you can use it for further actions)
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              _buildTitleText(),
              SizedBox(height: 20),
              _buildDivider(),
              SizedBox(height: 30),
              _buildCommentField(),
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

  Widget _buildCommentField() {
    return IdCustomFormField(
      controller: comment,
      hintText: 'Write a comment of situation...',
      title: '',
      keyboard: TextInputType.text,
      maxLength: 30,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a comment';
        }
        return null;
      },
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      onTap: () {
        if (formKey.currentState?.validate() ?? false) {
          Navigator.pushNamed(context, RouteManager.scanScreen);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Next', style: Appstyle.small15(context)),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
