import 'package:flutter/material.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/widgets/barcode_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../../../core/resuable_component/LottieWidget.dart';
import '../../../../core/resuable_component/id_CustomField.dart';
import '../../../../core/resuable_component/resuable_AppBar.dart';
import '../resuable_component/Custom_textfield.dart';

class ScanScreen extends StatefulWidget {
  String photo;
  String comment;
  ScanScreen(this.comment,this.photo);
  @override
  State<ScanScreen> createState() => _ScanScreenState();

}

class _ScanScreenState extends State<ScanScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController idController;
  bool showScanner = false;
  late MobileScannerController scannerController;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    scannerController = MobileScannerController();
  }

  @override
  void dispose() {
    idController.dispose();
    scannerController.dispose();
    super.dispose();
  }

  void _toggleScanner() {
    setState(() {
      showScanner = !showScanner;
      isScanning = showScanner;
    });
  }

  void _handleScan(BarcodeCapture barcodeCapture) {
    if (!isScanning) return;

    final barcodes = barcodeCapture.barcodes;
    if (barcodes.isNotEmpty) {
      final code = barcodes.first.rawValue;
      print("Scanned QR code value: $code"); // طباعة النص في الكونصول

      if (code != null && code.isNotEmpty) {
        setState(() {
          idController.text = code;
          isScanning = false;
          showScanner = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No QR code detected")),
        );
      }
    }
  }

  void _navigateToNextScreen() {
    // هنا لو عايز تروح حتى لو مفيش قيمة خلي التعليق تحت
    // if (idController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Please enter or scan the Patient ID")),
    //   );
    //   return;
    // }

    Navigator.pushNamed(
      context,
      RouteManager.homeScreenRoutes,
      arguments: {'patientID': idController.text},
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: CustomAppBar(navigatorScreen: RouteManager.photoScreen),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // يخلي العمود ياخد أقل مساحة ممكنة
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieWidget(
                Animation: 'assets/images/lottie/scanner.json',
                StaticImage: 'assets/images/lottie/scan_photo.png',
              ),
              ElevatedButton.icon(
                onPressed: _toggleScanner,
                icon: Icon(showScanner ? Icons.close : Icons.qr_code_scanner),
                label: Text(showScanner ? 'Close Scanner' : 'Scan QR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.secondaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: Appstyle.small15(context),
                ),
              ),
              SizedBox(height: 40),
              if (showScanner)
                QRScannerWidget(
                  controller: scannerController,
                  onDetect: _handleScan,
                )
              else
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Scan to continue', style: Appstyle.small20(context)),
                    Text('-OR-', style: Appstyle.small20(context)),
                    SizedBox(height: 29),
                    CustomHomeTextfield(
                      controller: idController,
                      suffixIcon: Icon(Icons.local_hospital, color: ColorManager.secondaryColor),
                      labelText: "Type Patient ID...",
                      hintText: "Type Patient ID...",
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: (value) {
                        // ممكن تضيف فاليديشن هنا لو حبيت
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _navigateToNextScreen,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, color: ColorManager.secondaryColor, size: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
