import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart';
import '../../../../../core/di/di.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
 import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';
import '../../resuable_widgets/Widget/VerListScreen/ListScreenModel.dart';
import '../../resuable_widgets/Widget/deals/deal_list/DealsList.dart';

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
                        child: DealsList(state.drEntity)),
                    SizedBox(height: 13,),
                    TextWidget( text:StringsManager.doctor,),
                    ListScreen(modelList: state.drEntity,),

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
