import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/hospital_usecase.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:ill_vent/presentation/home/tabs/4-hospital_tab/ViewModel/hospital_intent.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_result.dart';

part 'hospital_view_model_state.dart';
@injectable
class HospitalViewModelCubit extends Cubit<HospitalViewModelState> {
  static HospitalViewModelCubit get(context) => BlocProvider.of(context);
  List<HospitalResponse> hospitals = []; // المتغير الجديد لتخزين المستشفيات
  HospitalUsecase hospitalUsecase;
  HospitalViewModelCubit(this.hospitalUsecase) : super(HospitalViewModelInitial());

  void doIntent(HospitalIntent hospitalIntent) {
    switch (hospitalIntent) {
      case GetHospitalIntent():
        _getHospital(intent: hospitalIntent);
        break;
    }

  }

  void _getHospital({required GetHospitalIntent intent}) async {
    if (hospitals.isNotEmpty) {
      if (!isClosed) emit(HospitalViewModelSuccess(hospitals));
    } else {
      if (!isClosed) emit(HospitalViewModelLoading());

      var response = await hospitalUsecase.call();

      if (response is SuccessApiResult<List<HospitalResponse>>) {
        hospitals = response.data ?? [];

        if (!isClosed) emit(HospitalViewModelSuccess(hospitals));
      } else if (response is ErrorApiResult<List<HospitalResponse>>) {
        if (!isClosed) emit(HospitalViewModelError(response.exception.toString()));
      } else {
        if (!isClosed) emit(HospitalViewModelError("Unknown exception"));
      }
    }
  }
}
