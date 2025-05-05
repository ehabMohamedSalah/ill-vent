import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/available_time_usecase.dart';
import 'package:ill_vent/Domain/usecase/get_dr_by_id_usecase.dart';
import 'package:ill_vent/data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_by_id_response/GetDrByIdResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/api_result.dart';


part 'specific_doctor_state.dart';
@injectable
class SpecificDoctorCubit extends Cubit<SpecificDoctorState> {
  SpecificDoctorUsecase specificDoctorUsecase;
  AvailableTimeUsecase availableTimeUsecase;
  SpecificDoctorCubit(this.specificDoctorUsecase,this.availableTimeUsecase) : super(SpecificDoctorInitial());

  static SpecificDoctorCubit get(context){
    return BlocProvider.of(context);
  }
  Future<void> fetchDr({required String id}) async {
    if (!isClosed) emit(SpecificDrLoading());

    final response = await specificDoctorUsecase.call(id: id);

    if (response is SuccessApiResult<GetDrByIdResponse>) {
      emit(SpecificDrSuccess(response.data ));
    } else if (response is ErrorApiResult<GetDrByIdResponse>) {
      emit(SpecificDrError(response.exception.toString()));
    } else {
      emit(SpecificDrError("Unknown error"));
    }
  }



}

