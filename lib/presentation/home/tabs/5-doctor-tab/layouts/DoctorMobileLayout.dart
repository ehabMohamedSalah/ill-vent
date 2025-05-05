import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/widgets/VerItemWidget.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
 import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';
import '../../resuable_widgets/Widget/VerListScreen/ListScreenModel.dart';
import '../../resuable_widgets/Widget/deals/deal_list/DealsList.dart';
import '../../resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/DealDetailsScreen.dart';
import '../Widgets/doctor_card.dart';

 class DoctorMobileLayout extends StatelessWidget {
  const DoctorMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => getIt<DrViewModelCubit>()..fetchDr(),

        child: BlocBuilder<DrViewModelCubit, DrViewModelState>(

            builder: (context, state) {
              if (state is DrLoading) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.red,
                    size: 50.0,
                  ),
                );
              }
              if(state is DrSuccess){
                return Column(
                  children: [

                    TextWidget( text:StringsManager.doctor,),
                    Expanded(
                      child: ListView.separated(
                      itemBuilder:  (context, index) => DoctorCard(model: state.drEntity[index],),
                      separatorBuilder: (context, index) => SizedBox(height: 8,),
                      itemCount: state.drEntity.length,
                      ),
                  ),

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
