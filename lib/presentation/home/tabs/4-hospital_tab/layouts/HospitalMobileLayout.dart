import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/strings_manager.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:ill_vent/presentation/home/tabs/4-hospital_tab/ViewModel/hospital_intent.dart';
import 'package:ill_vent/presentation/home/tabs/4-hospital_tab/ViewModel/hospital_view_model_cubit.dart';

import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/error_message.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
 import '../../../../../core/utils/Appstyle.dart';
import '../../../../../data_layer/model/widget_model.dart';


class HospitalMobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) {
          final cubit = getIt<HospitalViewModelCubit>();
          cubit.doIntent(GetHospitalIntent());
          return cubit;
        },
        child: BlocBuilder<HospitalViewModelCubit, HospitalViewModelState>(
          builder: (context, state) {
            if (state is HospitalViewModelLoading) {
              return LoadingCircle();
            } else if (state is HospitalViewModelSuccess) {
              final hospitals = state.response;

              if (hospitals.isEmpty) {
                return Center(child: Text("لا توجد مستشفيات حالياً."));
              }

              return Column(
                children: [
                  const SizedBox(height: 13),
                  TextWidget(text: StringsManager.hospital),
                  TabVertItem(modelList: hospitals),
                ],
              );
            } else if (state is HospitalViewModelError) {
              return ErrorWidgett( onPressed: () {
                HospitalViewModelCubit.get(context)
                    .doIntent(GetHospitalIntent());
              },message: state.errorMsg);
            } else {
              return const Center(child: Text("لا توجد بيانات."));
            }
          },
        ),
      ),
    );
  }
}
