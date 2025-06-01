import 'dart:convert' show base64Decode;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/error_message.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import '../view_model/medical_history_view_model_cubit.dart';

class QrFloatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<MedicalHistoryViewModelCubit>()..getQRMedicalHistory(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Qr & userFriendlyToken",
            style: Appstyle.small20(context)
                .copyWith(color: ColorManager.secondaryColor),
          ),
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
        body: BlocConsumer<MedicalHistoryViewModelCubit,
            MedicalHistoryViewModelState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetQrError) {
              return ErrorWidgett(
                message: state.err,
                onPressed: () {
                  context.read<MedicalHistoryViewModelCubit>()
                    ..getQRMedicalHistory();
                },
              );
            }

            if (state is GetQrSuccess) {
              final data = state.response;
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,  // هنا بدل start
                  mainAxisAlignment: MainAxisAlignment.center,    // اختياري، لو عايز توسيط عمودي
                  children: [
                    Text(
                      "🧾 QR Code:",
                      style: Appstyle.small20(context).copyWith(color: Colors.black),
                      textAlign: TextAlign.center, // لضمان إن النص كمان في النص
                    ),
                    SizedBox(height: 16),
                    Image.memory(base64Decode(data!.qrCodeData ?? "")),
                    SizedBox(height: 24),
                    Text(
                      "User Friendly Token:",
                      style: Appstyle.small20(context).copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      data.userFriendlyToken ?? "",
                      style: Appstyle.small20(context).copyWith(
                        color: ColorManager.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
  }
}
