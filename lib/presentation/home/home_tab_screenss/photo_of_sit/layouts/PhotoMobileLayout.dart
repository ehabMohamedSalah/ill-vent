import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/resuable_component/id_CustomField.dart';
import '../../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';

class PhotoMobileLayout extends StatefulWidget {
  @override
  _PhotoMobileLayoutState createState() => _PhotoMobileLayoutState();
}

class _PhotoMobileLayoutState extends State<PhotoMobileLayout> {
  File? _image;
  final ImagePicker _picker = ImagePicker();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController comment;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comment=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: CustomAppBar(navigatorScreen: RouteManager.scanScreen ,),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height*0.15,
            ),
            _image != null
                ? Image.file(
              _image!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            )
                : InkWell(
              onTap: () {
                _showPicker(context);
              },
              child: SvgPicture.asset(
                'assets/images/3_home&bottoms/afterScan/camera.svg',
                height: height * 0.2,
              ),
            ),
            SizedBox(height: 20),

            Center(child: Text("Take a Photo for \n the accident",style: Appstyle.large30(context),)),
            SizedBox(height: 20),
            Text("-OR-",style: Appstyle.small15(context).copyWith(color: Colors.white70),),
            SizedBox(height: 30),
            IdCustomFormField(controller: comment,hintText: 'Write a comment of situation...',title: '',keyboard: TextInputType.text,maxLength: 30,validator: (value){},),
            Spacer(),
            InkWell(
            onTap: (){
            Navigator.pushNamed(context, RouteManager.findingScreen);
            },
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text('Next',style: Appstyle.small15(context),),
            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
            SizedBox(width: 10,)
            ],
            ),

            ),
            SizedBox(height: 20,)
          ],

        ),
      ),
    );
  }
  // Function to pick image
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Function to show the bottom sheet
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: ColorManager.secondaryColor,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(

                leading: Icon(Icons.photo,color: Colors.white,),
                title: Text('Pick from Gallery',style: Appstyle.small20(context),),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt,color: Colors.white),
                title: Text('Take a Photo',style: Appstyle.small20(context),),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera,);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
