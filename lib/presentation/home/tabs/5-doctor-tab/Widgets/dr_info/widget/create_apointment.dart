import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/LoginCustomFormField.dart';
import 'package:ill_vent/core/resuable_component/custom_button.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';

import '../../../ViewModel/dr_view_model_cubit.dart';

class CreateApointment extends StatefulWidget {
  final String drID;
  final String appointmentDate;
  final String startTime;

  CreateApointment({
    required this.startTime,
    required this.drID,
    required this.appointmentDate,
  });

  @override
  State<CreateApointment> createState() => _CreateApointmentState();
}

class _CreateApointmentState extends State<CreateApointment> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneContrller;
  late TextEditingController patientAgeController;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneContrller = TextEditingController();
    patientAgeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrViewModelCubit>(),
      child: Scaffold(
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
        ),
        backgroundColor: ColorManager.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.top,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        "Please fill in your details \nto book with the doctor.",
                        style: Appstyle.small20(context)
                            .copyWith(color: ColorManager.secondaryColor),
                        textAlign: TextAlign.center,
                      ),

                      // Name
                      CustomFormField(
                        filledColor: true,
                        maxLength: 50,
                        title: "Name",
                        controller: nameController,
                        hintText: "",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a name";
                          }
                          final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
                          if (!nameRegExp.hasMatch(value.trim())) {
                            return "Name must contain only letters";
                          }
                          return null;
                        },
                      ),

                      // Phone Number
                      CustomFormField(
                        maxLength: 11,
                        title: "Phone Number",
                        controller: phoneContrller,
                        hintText: "",
                        keyboard: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a phone number";
                          }
                          final phoneRegExp = RegExp(r'^(01)[0-9]{9}$');
                          if (!phoneRegExp.hasMatch(value.trim())) {
                            return "Enter a valid Egyptian phone number";
                          }
                          return null;
                        },
                      ),

                      // Age
                      CustomFormField(
                        maxLength: 2,
                        title: "Age",
                        controller: patientAgeController,
                        hintText: "",
                        keyboard: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your age";
                          }
                          final age = int.tryParse(value.trim());
                          if (age == null || age < 1 || age > 100) {
                            return "Enter a valid age between 1 and 100";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      // Gender Dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: ColorManager.secondaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        value: selectedGender,
                        items: ['Male', 'Female'].map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a gender';
                          }
                          return null;
                        },
                      ),

                      Expanded(child: Container()),

                      BlocConsumer<DrViewModelCubit, DrViewModelState>(
                        listener: (context, state) {
                          if (state is CreateAppointMentSuccess) {
                            Navigator.pushNamed(
                              context,
                              RouteManager.homeScreenRoutes,
                            );
                            toastMessage(
                              message: "Book Successful",
                              tybeMessage: TybeMessage.positive,
                            );
                          } else if (state is CreateAppointMentError) {
                            toastMessage(
                              message: "Already Booked",
                              tybeMessage: TybeMessage.negative,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is CreateAppointMentLoading) {
                            return Center(child: LoadingCircle());
                          }

                          return SizedBox(
                            width: double.infinity,
                            child: CustomButton(() {
                              if (_formKey.currentState!.validate()) {
                                final patientModel = PatientModel(
                                  doctorId: int.parse(widget.drID),
                                  appointmentDate: widget.appointmentDate,
                                  patientAge:
                                  int.parse(patientAgeController.text.trim()),
                                  patientGender: selectedGender ?? "male",
                                  startTime: widget.startTime,
                                  patientName: nameController.text.trim(),
                                  patientPhoneNumber:
                                  phoneContrller.text.trim(),
                                );

                                DrViewModelCubit.get(context)
                                    .createAppointment(patientModel);
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Please correct the errors.",
                                  backgroundColor: Colors.orange,
                                  textColor: Colors.white,
                                );
                              }
                            }, "Appointment"),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
