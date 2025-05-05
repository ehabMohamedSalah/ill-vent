import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/Domain/usecase/doctor_usecase.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/usecase/dr_usecase.dart';

part 'dr_view_model_state.dart';

@injectable
class DrViewModelCubit extends Cubit<DrViewModelState> {
  DrUsecase doctorUsecase;
  DrViewModelCubit(this.doctorUsecase) : super(DrViewModelInitial());
  static DrViewModelCubit get(context){
    return BlocProvider.of(context);
  }
  Future<void> fetchDr() async {
    if (!isClosed) emit(DrLoading());

    final response = await doctorUsecase.call();

    if (response is SuccessApiResult<List<GetDrResponse>>) {
      emit(DrSuccess(response.data ?? []));
    } else if (response is ErrorApiResult<List<GetDrResponse>>) {
      emit(DrError(response.exception.toString()));
    } else {
      emit(DrError("Unknown error"));
    }
  }
}