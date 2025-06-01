import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/medical_usecase/get_qr_usecase.dart';
import 'package:ill_vent/Domain/usecase/medical_usecase/medical_history_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_result.dart';
import '../../../../data_layer/model/medical_response/MedicalResponse.dart';
import '../../../../data_layer/model/medical_response/qr_resonse/QrMedicalHistoryResponse.dart';

part 'medical_history_view_model_state.dart';

@injectable
class MedicalHistoryViewModelCubit extends Cubit<MedicalHistoryViewModelState> {
  MedicalHistoryUsecase medicalHistoryUsecase;
  GetQRUsecase getQRUsecase;
  MedicalHistoryViewModelCubit(this.medicalHistoryUsecase,this.getQRUsecase) : super(MedicalHistoryViewModelInitial());
  static MedicalHistoryViewModelCubit get(context) => BlocProvider.of(context);


  getMedicalHistory() async {
    if (!isClosed) emit(MedicalHistoryViewModelLoading());

    final response = await medicalHistoryUsecase.call();

    if (response is SuccessApiResult<MedicalResponse>) {

       emit(MedicalHistoryViewModelSuccess(response.data));

    } else if (response is ErrorApiResult<MedicalResponse>) {
     emit(MedicalHistoryViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
  emit(MedicalHistoryViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

  getQRMedicalHistory() async {
    if (!isClosed) emit(GetQrViewModelLoading());

    final response = await getQRUsecase.call();

    if (response is SuccessApiResult<QrMedicalHistoryResponse>) {

       emit(GetQrSuccess(response.data));

    } else if (response is ErrorApiResult<QrMedicalHistoryResponse>) {
     emit(GetQrError(response.exception.toString()));
      print(response.exception.toString());
    } else {
  emit(GetQrError("Unknown error"));
      print("Unknown error");
    }
  }
}
