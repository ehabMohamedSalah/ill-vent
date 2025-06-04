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

class FindingHospitalScreen extends StatelessWidget {
  final String reqID;
  FindingHospitalScreen(this.reqID);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmergencyViewModelCubit>()..emergencyStatus(reqID),
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes),
        body: BlocBuilder<EmergencyViewModelCubit, EmergencyViewModelState>(
          builder: (context, state) {
            if (state is EmergencyStatusLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/3_home&bottoms/afterScan/finding_hospital.png"),
                    SizedBox(height: 20),
                    Text(
                      "Finding Nearest Hospital...",
                      style: Appstyle.medium25(context).copyWith(color: ColorManager.secondaryColor),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please wait until we get the quickest response.",
                      style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else if (state is HospitalFound) {
              final hospitalData = state.hospitalData;
              return    AcceptedHospitalScreen(state.hospitalData);
            }
            else if (state is EmergencyStatusError) {
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              // Default fallback UI
              return Center(
                child: Text(
                  "Waiting for hospital response...",
                  style: Appstyle.medium25(context).copyWith(color: ColorManager.secondaryColor),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
