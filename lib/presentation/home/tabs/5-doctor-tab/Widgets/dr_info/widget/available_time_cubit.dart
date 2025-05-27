import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../Domain/usecase/available_time_usecase.dart';
import '../../../../../../../core/api/api_result.dart';
import '../../../../../../../data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';

part 'available_time_state.dart';
@injectable
class AvailableTimeCubit extends Cubit<AvailableTimeState> {
  AvailableTimeUsecase availableTimeUsecase;

  AvailableTimeCubit(this.availableTimeUsecase) : super(AvailableTimeInitial());

  static AvailableTimeCubit get(context) => BlocProvider.of(context);


  Future<void> availableTime({required String date,required String drID}) async {

    if (!isClosed) emit(AvailableTimeLoading());

    final response = await availableTimeUsecase.call(date: date,drID: drID);

    if (response is SuccessApiResult<List<AvailableTimeResponse>>) {
      emit(AvailableTimeSuccess(response.data ?? []));
    } else if (response is ErrorApiResult<List<AvailableTimeResponse>>) {
      emit(AvailableTimeError(response.exception.toString()));
      print("=========================================");

      print(response.exception.toString());
    } else {

      emit(AvailableTimeError("Unknown error"));
    }
  }
}
