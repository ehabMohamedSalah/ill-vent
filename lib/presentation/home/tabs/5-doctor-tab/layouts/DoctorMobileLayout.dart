import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/tab_horz_item1.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resuable_component/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Widgets-Tab/TabVertItem1.dart';
import '../../../../../core/resuable_component/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/Widgets-Tab/widgets/Text_Widget.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';

List<WidgetModel>model=[
  WidgetModel(image:'assets/images/6_doctorScreen/dr1.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:'Dr/ Ehab' ),
  WidgetModel(image:'assets/images/6_doctorScreen/dr2.png' ,desc: 'asssssssssaadaaasssssssssss',title:'Dr/ esraa' ),
  WidgetModel(image:'assets/images/6_doctorScreen/dr3.png' ,desc: 'asssssssssaaaaasssssssssss',title:'Dr/ Ehab' ),
  WidgetModel(image:'assets/images/6_doctorScreen/dr4.png' ,desc: 'asssssssssaaaaasssssssssss',title:'Dr/ Ehab'),
  WidgetModel(image:'assets/images/6_doctorScreen/dr5.png' ,desc: 'asssssssssaaaaasssssssssss',title:'Dr/ Ehab'),
  WidgetModel(image:'assets/images/6_doctorScreen/dr6.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:'Dr/ aser' ),

];
class DoctorMobileLayout extends StatelessWidget {
  const DoctorMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => getIt<DrViewModelCubit>()..FetchDr(),

        child: BlocBuilder<DrViewModelCubit, DrViewModelState>(
            builder: (context, state) {
              if(state is DrSuccess){
                return Column(
                  children: [
                    TextWidget( text: StringsManager.deals,),
                    Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: height*0.2 ,
                        child: TabHorzItem1(state.drEntity)),
                    SizedBox(height: 13,),
                    TextWidget( text:StringsManager.hospital,),
                    TabVertItem1(modelList: state.drEntity,),

                  ],
                );
              }
              if(state is DrError){
               return Center(child: Text(state.errorMsg),);
              }
              return Center(child: CircularProgressIndicator(),);
 
  },
),
      ),
    );
  }
}
