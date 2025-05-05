import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/Appstyle.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File) onImagePicked;

  ImagePickerWidget({required this.onImagePicked});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() => _image = File(pickedFile.path));
        widget.onImagePicked(_image!); // Pass image back to parent
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: ColorManager.secondaryColor,
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo, color: Colors.white),
              title: Text('Gallery', style: Appstyle.small20(context)),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.white),
              title: Text('Camera', style: Appstyle.small20(context)),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(Size size) {
    return _image != null
        ? Stack(
      children: [
        Image.file(
          _image!,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildErrorPlaceholder(),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                _image = null;
              });
            },
          ),
        ),
      ],
    )
        : InkWell(
      onTap: () => _showPicker(context),
      child: SvgPicture.asset(
        'assets/images/3_home&bottoms/afterScan/camera.svg',
        colorFilter: ColorFilter.mode(
          ColorManager.secondaryColor,
          BlendMode.srcIn,
        ),
        height: size.height * 0.2,
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 50, color: Colors.red),
          SizedBox(height: 8),
          Text('Image not available', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return _buildImageSection(size);
  }
}
