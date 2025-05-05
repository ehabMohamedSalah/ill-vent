import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/utils/strings_manager.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:ill_vent/presentation/home/tabs/4-hospital_tab/ViewModel/hospital_intent.dart';
import 'package:ill_vent/presentation/home/tabs/4-hospital_tab/ViewModel/hospital_view_model_cubit.dart';

import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/tab_horz_item.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
 import '../../../../../core/utils/Appstyle.dart';
import '../../../../../data_layer/model/widget_model.dart';

List<WidgetModel>model=[
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'One of the Partners of Cleopatra Group Hospitals Located in Salah El-Din Sq. in Heliopolis ',title:StringsManager.cataflarm,location: "39 Cleopatra، Maidan Salahuddin Square, Almazah, Heliopolis",profile: "Accept Private Medical Insurance",rate: "4.0" ),
];
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("تحميل البيانات..."),
                    CircularProgressIndicator(color: Colors.black),
                  ],
                ),
              );
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("حدث خطأ: ${state.errorMsg}"),
                    ElevatedButton(
                      onPressed: () {
                        HospitalViewModelCubit.get(context)
                            .doIntent(GetHospitalIntent());
                      },
                      child: Text("إعادة المحاولة"),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("لا توجد بيانات."));
            }
          },
        ),
      ),
    );
  }
}
