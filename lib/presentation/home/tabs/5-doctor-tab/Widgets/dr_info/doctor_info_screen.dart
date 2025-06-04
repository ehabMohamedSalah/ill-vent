import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ill_vent/core/resuable_component/custom_button.dart';
import 'package:ill_vent/core/resuable_component/error_message.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/view_model/specific_doctor_cubit.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/widget/available_time_cubit.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/widget/create_apointment.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/widget/schedule_widget.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/dr_info/widget/time_card.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/resuable_component/rating_dialog.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';

class DoctorInfoScreen extends StatefulWidget {
  final String drId;

  DoctorInfoScreen(this.drId);

  @override
  State<DoctorInfoScreen> createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {
  int? selectedIndex;
  int? timeSelected;
  String? startTime;
  String? appointmentDate;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpecificDoctorCubit>(
          create: (context) => getIt<SpecificDoctorCubit>()..fetchDr(id: widget.drId),
        ),
        BlocProvider<AvailableTimeCubit>(
          create: (context) => getIt<AvailableTimeCubit>()
            ..availableTime(drID: widget.drId, date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorManager.secondaryColor,
            ),
          ),
          centerTitle: true,
          title: BlocBuilder<SpecificDoctorCubit, SpecificDoctorState>(
            builder: (context, state) {
              if (state is SpecificDrSuccess) {
                return Column(
                  children: [
                    Text(
                      state.drEntity!.name ?? "Doctor Name",
                      style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.drEntity!.specialty ?? "Specialty",
                      style: TextStyle(color: ColorManager.secondaryColor),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<SpecificDoctorCubit, SpecificDoctorState>(
                builder: (context, state) {
                  if (state is SpecificDrSuccess) {
                    double rating = (state.drEntity!.rating ?? 0.0).toDouble();
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 180.h,
                              width: 180.w,
                              child: CachedNetworkImage(
                                imageUrl: state.drEntity!.imageUrl ?? "",
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[300],
                                  ),
                                  child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: RatingStars(
                                  rating: rating,
                                  starSize: 30.0,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.date_range, color: ColorManager.secondaryColor, size: 30),
                              Text("Schedule", style: TextStyle(color: ColorManager.secondaryColor, fontSize: 25)),
                            ],
                          ),
                          SizedBox(
                            height: 110.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(width: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.drEntity!.availableDays!.length,
                              itemBuilder: (context, index) {
                                final isSelected = index == selectedIndex;
                                final day = state.drEntity!.availableDays![index];

                                return GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      selectedIndex = index;
                                      timeSelected = null; // reset time when date changes
                                      startTime = null; // reset startTime when date changes
                                    });
                                    final date = day.date ?? DateFormat('yyyy-MM-dd').format(DateTime.now());
                                    appointmentDate = date;
                                    await AvailableTimeCubit.get(context).availableTime(drID: widget.drId, date: date);
                                  },
                                  child: ScheduleItem(day.formattedDate ?? "", isSelected),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text("Available Times", style: TextStyle(color: ColorManager.secondaryColor, fontSize: 25)),
                        ],
                      ),
                    );
                  }
                  else if (state is SpecificDrError) {
                    return ErrorWidgett(
                        message: state.errorMsg,
                        onPressed: () {
                          getIt<SpecificDoctorCubit>()..fetchDr(id: widget.drId);
                        },);
                  }
                  return LoadingCircle();
                },
              ),
              BlocBuilder<AvailableTimeCubit, AvailableTimeState>(
                builder: (context, state) {
                  if (state is AvailableTimeSuccess) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          (selectedIndex == null)
                              ? Center(
                              child: Text(
                                "you must choose a day",
                                style: TextStyle(color: Colors.red),
                              ))
                              : SizedBox(
                            height: 140.h,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // عدد الأعمدة
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.times.length,
                              itemBuilder: (context, index) {
                                final isSelectedd = index == timeSelected;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      timeSelected = index;
                                      startTime = state.times[index].formattedStartTime ?? "";
                                    });
                                  },
                                  child: TimeItem(state.times[index].formattedStartTime ?? "", isSelectedd),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          (timeSelected == null)
                              ? Center(
                              child: Text(
                                "you must choose a time",
                              ))
                              : SizedBox(
                            height: 30.h,
                            width: double.infinity,
                            child:CustomButton(
                                    (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreateApointment(
                                            startTime: startTime ?? "",
                                            drID: widget.drId,
                                            appointmentDate: appointmentDate ?? "",
                                          ),
                                        ),
                                      );
                                    }
                                    , "Appointment"
                            )


                          )
                        ],
                      ),
                    );
                  }
                  else if (state is AvailableTimeError) {
                    return ErrorWidgett(
                        message: state.errorMsg,
                        onPressed:  () async{
                          await AvailableTimeCubit.get(context).availableTime(drID: widget.drId, date: appointmentDate??"");
                        },
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
