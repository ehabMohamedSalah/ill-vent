import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/data_layer/model/emergency_response/emergency_status/EmergencyStatusResponse.dart';
import 'package:ill_vent/presentation/home/emergency_screens/FindHospital/google_map/map_screen.dart';

class AcceptedHospitalScreen extends StatelessWidget {
  final EmergencyStatusResponse hospital;
  const AcceptedHospitalScreen(this.hospital, {super.key});

  @override
  Widget build(BuildContext context) {
    final accepted = hospital.data?.acceptedHospital;

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,

       bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          height: 55.h,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
                Navigator.push(context,  MaterialPageRoute(builder:  (context) {
                  return MapScreen(hospital.data!.requestId??1);
                },));
              },
            icon: Icon(Icons.map, color: Colors.white),
            label: Text(
              "Show on Map",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/images/background.png", fit: BoxFit.fill,)),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Title
                    Text(
                      "Accepted Hospital",
                      style: Appstyle.large30(context).copyWith(
                        color: ColorManager.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// Hospital Info Card
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      elevation: 5,
                      color: ColorManager.secondaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.local_hospital, color: Colors.white),
                              title: Text(accepted?.name ?? "N/A",
                                  style: Appstyle.small20(context).copyWith(color: Colors.white)),
                            ),
                            ListTile(
                              leading: Icon(Icons.location_on, color: Colors.white),
                              title: Text(accepted?.location ?? "N/A",
                                  style: Appstyle.small20(context).copyWith(color: Colors.white)),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone, color: Colors.white),
                              title: Text(accepted?.contactNumber ?? "N/A",
                                  style: Appstyle.small20(context).copyWith(color: Colors.white)),
                            ),
                            ListTile(
                              leading: Icon(Icons.route, color: Colors.white),
                              title: Text("${accepted?.distanceKm?.toStringAsFixed(1)} km" ?? "N/A",
                                  style: Appstyle.small20(context).copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// Ambulance Message
                    Column(
                      children: [
                        Icon(Icons.local_hospital, size: 60.sp, color: ColorManager.secondaryColor),
                        SizedBox(height: 12.h),
                        Text(
                          "🚑 The ambulance is on\nits way to you",
                          style: Appstyle.medium25(context).copyWith(color: ColorManager.secondaryColor),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Please stay at your location\nuntil the team arrives.",
                          style: Appstyle.small20(context).copyWith(color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    SizedBox(height: 80.h), // To avoid hiding content behind the button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
