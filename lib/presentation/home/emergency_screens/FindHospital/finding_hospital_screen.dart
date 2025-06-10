import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/home/emergency_screens/FindHospital/widgets/accepted_hospital_screen.dart';
import '../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../core/utils/routes_manager.dart';
import '../view_model/emergency_view_model_cubit.dart';

class FindingHospitalScreen extends StatefulWidget {
  final String reqID;
  FindingHospitalScreen(this.reqID);

  @override
  State<FindingHospitalScreen> createState() => _FindingHospitalScreenState();
}

class _FindingHospitalScreenState extends State<FindingHospitalScreen> {
  bool hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<EmergencyViewModelCubit>()..emergencyStatus(widget.reqID),
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.fill,
              ),
            ),
            BlocListener<EmergencyViewModelCubit, EmergencyViewModelState>(
              listener: (context, state) {
                if (state is HospitalFound && !hasNavigated) {
                  hasNavigated = true;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AcceptedHospitalScreen(state.hospitalResponse),
                    ),
                  );
                }

                if (state is EmergencyStatusRejected && !hasNavigated) {
                  hasNavigated = true;

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.red.shade50,
                      title: Text(
                        "Emergency Alert",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        "Call 123 Immediately! No hospital accepted your request.",
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
Navigator.pushNamedAndRemoveUntil(context, RouteManager.homeScreenRoutes,  (route) => false,);                          },
                          child: Text(
                            "Go to Home",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                }
              },
              child: BlocBuilder<EmergencyViewModelCubit,
                  EmergencyViewModelState>(
                builder: (context, state) {
                  if (state is EmergencyStatusLoading ) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/3_home&bottoms/afterScan/finding_hospital.png",
                            width: 200,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Finding Nearest Hospital...",
                            style: Appstyle.medium25(context)
                                .copyWith(color: ColorManager.secondaryColor),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Please wait until we get the quickest response.",
                            textAlign: TextAlign.center,
                            style: Appstyle.small20(context)
                                .copyWith(color: ColorManager.secondaryColor),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Waiting for hospital response...",
                        style: Appstyle.medium25(context)
                            .copyWith(color: ColorManager.secondaryColor),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _callEmergencyNumber(String number) {
    print("Calling emergency number: $number");
    // If you want to trigger real call use:
    // launchUrl(Uri.parse("tel:$number"));
  }
}
