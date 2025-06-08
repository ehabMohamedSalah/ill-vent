import 'dart:convert' show base64Decode;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/error_message.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/size_config.dart';
import 'package:ill_vent/presentation/home/medical_history/view/widget/info_row.dart';

import '../view_model/medical_history_view_model_cubit.dart';

class MedicalFloatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<MedicalHistoryViewModelCubit>()..getMedicalHistory(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.secondaryColor,
          title: Text(
            "Your Medical History",
            style: Appstyle.small20(context)
                .copyWith(color: ColorManager.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorManager.white,
            ),
          ),
        ),
        backgroundColor: ColorManager.primaryColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"), // path lel sora
              fit: BoxFit.cover, // cover | fill | contain | etc
            ), ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: SizeConfig.height
                ),
                child: IntrinsicHeight(
                  child: BlocConsumer<MedicalHistoryViewModelCubit,
                      MedicalHistoryViewModelState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is MedicalHistoryViewModelError) {
                        return ErrorWidgett(
                          message: state.err,
                          onPressed: () {
                            context.read<MedicalHistoryViewModelCubit>()
                              ..getMedicalHistory();
                          },
                        );
                      }

                      if (state is MedicalHistoryViewModelSuccess) {
                        final data = state.response?.data;
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                color: ColorManager.primaryColor.withOpacity(0.1),
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("General Information",
                                          style: Appstyle.small20(context).copyWith(
                                            color: ColorManager.secondaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          )),
                                      SizedBox(height: 12),
                                      InfoRow(label: "📍 Address", value: data?.address),
                                      InfoRow(label: "🩸 Blood Type", value: data?.bloodType),
                                      InfoRow(label: "🎂 Age", value: data?.age?.toString()),
                                      InfoRow(label: "⚖️ Weight", value: "${data?.weight} kg"),
                                      InfoRow(label: "📏 Height", value: "${data?.height} cm"),
                                      InfoRow(label: "👩 Gender", value: data?.gender),
                                      InfoRow(label: "🩺 Has Diabetes", value: data?.hasDiabetes == true ? "Yes" : "No"),
                                      if (data?.hasDiabetes == true)
                                        InfoRow(label: "   ↳ Type", value: data?.diabetesType),
                                      InfoRow(
                                          label: "🌰 Allergies",
                                          value: (data?.hasAllergies == true
                                              ? data?.allergiesDetails
                                              : "No")),
                                      InfoRow(label: "💊 On Birth Control", value: data?.birthControlMethod ?? "N/A"),
                                    ],
                                  ),
                                ),
                              ),

                              if (data?.medicalConditions != null && data!.medicalConditions!.isNotEmpty)
                                Card(
                                  color: ColorManager.primaryColor.withOpacity(0.1),
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("🩹 Medical Conditions",
                                            style: Appstyle.small20(context).copyWith(
                                              color: ColorManager.secondaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            )),
                                        SizedBox(height: 12),
                                        ...data.medicalConditions!.map(
                                              (cond) => Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 4),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("• ", style: TextStyle(color: ColorManager.secondaryColor, fontSize: 18)),
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${cond.condition}: ${cond.details}",
                                                      style: Appstyle.small20(context).copyWith(color: ColorManager.secondaryColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );


                      }

                      return Center(child: LoadingCircle());
                    },
                  ),
                ),
              );
            },

          ),
        ),
      ),
    );
  }
}
