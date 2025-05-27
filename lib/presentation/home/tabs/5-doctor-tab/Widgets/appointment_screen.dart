import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../../../../core/di/di.dart';
import '../ViewModel/dr_view_model_cubit.dart';

class DoctorAppointmentScreen extends StatelessWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<DrViewModelCubit>();
        cubit.getAppointment(); // fetch data
        return cubit;
      },
      child: BlocBuilder<DrViewModelCubit, DrViewModelState>(
        builder: (context, state) {

          if (state is GetAppointmentLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if(state is GetAppointmentSuccess){
            var appointments=state.appointment;

           return Scaffold(
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
               title: Text("Appointment",style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),
             ),
              body: (appointments!.length==null)?ListView.builder(
                itemCount: appointments!.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];

                  return Slidable(
                    key: ValueKey(appointment.id),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            context.read<DrViewModelCubit>().cancelAppointment(drID:" ${appointment.id}");
                            Navigator.pushNamed(context, RouteManager.homeScreenRoutes, );

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("canceled Successful!")));
                                () {};
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(appointment.doctorName??"",style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),
                            SizedBox(width: 10.w,),
                            Text(appointment.doctorSpecialty??"",style: Appstyle.VerySmall15(context).copyWith(color: Colors.black),),

                          ],
                        ),
                        subtitle: Text('${appointment.appointmentDate?.substring(0, 10)} at ${appointment.formattedTime}'),
                        trailing: Icon(Icons.arrow_forward_ios),

                      ),
                    ),
                  );
                },
              ):
              Center(child: Text(    "You haven’t booked anything yet!",
                 style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),),),
            );
          }
return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
