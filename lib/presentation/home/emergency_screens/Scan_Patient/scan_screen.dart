import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/dataclass/emergency_dataclass.dart';
import 'package:ill_vent/presentation/home/emergency_screens/Scan_Patient/widgets/barcode_scanner.dart';
import 'package:ill_vent/presentation/home/emergency_screens/view_model/emergency_view_model_cubit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import '../../../../core/resuable_component/LottieWidget.dart';
import '../../../../core/resuable_component/resuable_AppBar.dart';
import '../FindHospital/finding_hospital_screen.dart';
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

  String? scannedQrCode;

  void _handleScan(BarcodeCapture barcodeCapture) {
    if (!isScanning) return;

    final barcodes = barcodeCapture.barcodes;
    if (barcodes.isNotEmpty) {
      final code = barcodes.first.rawValue;
      print("Scanned QR code value: $code");

      if (code != null && code.isNotEmpty) {
        setState(() {
          scannedQrCode = code;
           isScanning = false;
          showScanner = false;
        });
      }
    }
  }

  void _navigateToNextScreen(EmergencyDataclass emergencyModel) {

EmergencyViewModelCubit.get(context).emergencyRequest(emergencyreq: emergencyModel);
log(emergencyModel.medicalHistoryToken);
log(emergencyModel.medicalHistoryQrCode);
log("${emergencyModel.userLongitude}");
log("${emergencyModel.userLatitude}");
log(emergencyModel.injuryPhotoBase64);
log(emergencyModel.injuryDescription);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => getIt<EmergencyViewModelCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: CustomAppBar(navigatorScreen: RouteManager.photoScreen),
        body:
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"), // path lel sora
                  fit: BoxFit.cover, // cover | fill | contain | etc
                ), ),
              child: LayoutBuilder(builder:  (context, constraints) {
                return SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
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
                            BlocConsumer<EmergencyViewModelCubit,EmergencyViewModelState>(
                              builder: (context, state) {
                                if(state is EmergencyViewModelLoading){
                                  return LoadingCircle();
                                }

                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      EmergencyViewModelCubit.get(context).emergencyRequest(
                                        emergencyreq: EmergencyDataclass(
                                          injuryDescription: widget.comment??"",
                                          injuryPhotoBase64: widget.photo??"",
                                          medicalHistoryQrCode: scannedQrCode??"",
                                          medicalHistoryToken: idController.text??"",
                                          priority: 1,
                                          userLatitude: 30.0644,
                                          userLongitude: 31.2497,

                                        ),
                                      );

                                      log(idController.text??"");
                                      log(scannedQrCode??"");
                                      log("30.0644");
                                      log("31.2497");
                                      log(widget.photo??"");
                                      log(widget.comment??"");
                                    },

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
                                );
                              },
                              listener: (context, state) {
                                if(state is EmergencyViewModelError){
                                  return toastMessage(
                                      message: " please Try Again",
                                      tybeMessage: TybeMessage.negative
                                  );}
                                else if (state is EmergencyViewModelSuccess){
                                  toastMessage(
                                      message: "Request send Successful please wait until any hospital accept",
                                      tybeMessage: TybeMessage.positive
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder:  (context) {
                                    return FindingHospitalScreen(state.response!.data!.requestId.toString());
                                  },));
                                  /* Navigator.pushNamed(
                                   context,
                                   RouteManager.findingScreen,
                                   arguments: {'patientID': idController.text},
                                 );*/
                                }
                              },

                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },),
            ),

      ),
    );
  }
}
