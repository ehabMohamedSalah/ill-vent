import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/ViewModel/pharmcy_intent.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/ViewModel/pharmcy_view_model_cubit.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';

class PharmacyMobileLayout extends StatelessWidget {
  PharmacyMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) {
          final cubit = getIt<PharmcyViewModelCubit>();
          cubit.doIntent(GetPharmcyIntent());
          return cubit;
        },
        child: BlocBuilder<PharmcyViewModelCubit, PharmcyViewModelState>(
          builder: (context, state) {
            if (state is PharmcyViewModelLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("تحميل البيانات..."),
                    CircularProgressIndicator(color: Colors.black),
                  ],
                ),
              );
            } else if (state is PharmcyViewModelSuccess) {
              final pharmcy = state.response;

              if (pharmcy.isEmpty) {
                return Center(child: Text("لا توجد صيدليات حالياً."));
              }

              return Column(
                children: [
                  const SizedBox(height: 13),
                  TextWidget(text: "Pharmcy"),
                  TabVertItem(modelList: pharmcy),
                ],
              );
            } else if (state is PharmcyViewModelError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("حدث خطأ: ${state.message}"),
                    ElevatedButton(
                      onPressed: () {
                        final cubit = PharmcyViewModelCubit.get(context);
                        cubit.doIntent(GetPharmcyIntent());
                      },
                      child: Text("إعادة المحاولة"),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('لا توجد بيانات.'));
            }
          },
        ),
      ),
    );
  }
}
