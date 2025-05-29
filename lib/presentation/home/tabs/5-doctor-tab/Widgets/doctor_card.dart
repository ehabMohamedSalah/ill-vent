import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/layouts/shop_mobile_layout.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/doctor_info_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/di/di.dart';
import 'dr_info/view_model/specific_doctor_cubit.dart';

class DoctorCard extends StatefulWidget {
  final GetDrResponse model;
  const DoctorCard({super.key, required this.model});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم مع keepAlive

    double height = MediaQuery
        .sizeOf(context)
        .height;
    double width = MediaQuery
        .sizeOf(context)
        .width;

    return Container(

      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [

                Expanded(
                  flex: 1,
                  child: Image.network(
                    widget.model.thumbnail ?? "",  // Use the image URL from the model, or an empty string as a fallback
                    fit: BoxFit.fill,             // Fill the space with the image
                    height: 70,                   // Set a fixed height for the image
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Show the image when fully loaded
                      } else {
                        return Center(child: CircularProgressIndicator()); // Show loading spinner while the image loads
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      // You can suppress the error message or avoid logging the error
                      return Center(
                        child: Icon(Icons.image_not_supported, size: 50), // Show a fallback icon
                      );
                    },
                  ),
                ),



                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.model.name ?? "",
                          style: Appstyle.small15(context).copyWith(
                              color: Colors.black, fontSize: 20),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " ${widget.model.rating} " ?? "",
                              style: Appstyle.small15(context)
                                  .copyWith(color: Colors.black26),
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.model.education ?? "",
                    style: Appstyle.small15(context).copyWith(
                        color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.model.location ?? "",
                    style: Appstyle.small15(context)
                        .copyWith(color: Color(0xff5774BA)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Image.asset(
                    "assets/images/5_hospitalScreen/healthicons_insurance-card.png"),
                SizedBox(width: 5),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      (widget.model.acceptInsurance ?? false)
                          ? "Accept Private Medical Insurance"
                          : "Not Private Medical Insurance",
                      style: Appstyle.small15(context).copyWith(color: Color(0xff5774BA)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),


              ],
            ),
            InkWell(
              onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) =>  DoctorInfoScreen(
                          "${widget.model.id}")));
                },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 36,
                  width: 108,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Book Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

 }