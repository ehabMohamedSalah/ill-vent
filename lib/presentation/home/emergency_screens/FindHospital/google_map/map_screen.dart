import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/home/emergency_screens/FindHospital/google_map/widget/custom_google_map.dart';
import 'package:ill_vent/presentation/home/emergency_screens/view_model/emergency_view_model_cubit.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../thanks_screen.dart';

class MapScreen extends StatelessWidget {
  int requestID;

  MapScreen(this.requestID);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmergencyViewModelCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocConsumer<EmergencyViewModelCubit,EmergencyViewModelState>(
            listener: (context, state) {
              if(state is CompleteEmergencySuccess){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThanksScreen(),));
                return toastMessage(
                    message: "The Ambulance Arrive",
                    tybeMessage: TybeMessage.positive
                );

              }else if(state is CompleteEmergencyError){
                return toastMessage(
                    message: "Try Again",
                    tybeMessage: TybeMessage.negative
                );
              }
            },
            builder: (context, state) {
              if(state is CompleteEmergencyLoading){
                return LoadingCircle();
              }
              return SizedBox(
                height: 55.h,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    EmergencyViewModelCubit.get(context)..completeEmergencyRequest(requestID);
                  },
                  label: Text(
                    "Ambulance reach you?",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              );
            },

          ),
        ),
        backgroundColor: ColorManager.primaryColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  width: double.infinity,
                  child: CustomGoogleMap(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/3_home&bottoms/afterScan/Ambulance-amico 1.png",
                          height: 300,
                        ),
                        // Add any other scrollable content here
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
