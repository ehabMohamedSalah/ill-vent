import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/medical_usecase/medical_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_result.dart';
import '../../../../data_layer/model/medical_history_dataclass.dart';
import '../../../../data_layer/model/medical_response/MedicalResponse.dart';

part 'medical_view_model_state.dart';
@injectable
class MedicalViewModelCubit extends Cubit<MedicalViewModelState> {
  MedicalHistoryUsecase medicalHistoryUsecase;
  static MedicalViewModelCubit get(context) => BlocProvider.of(context);

  MedicalViewModelCubit(this.medicalHistoryUsecase) : super(MedicalViewModelInitial());

  sendMedicalHistory( {required MedicalHistory patientModel })async{
    if (!isClosed) emit(MedicalViewModelLoading());

    var response=await medicalHistoryUsecase.call(patientModel: patientModel );
    if (response is SuccessApiResult<MedicalResponse>) {
       emit(MedicalViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<MedicalResponse>) {
      emit(MedicalViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(MedicalViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

}
