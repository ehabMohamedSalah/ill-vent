import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Domain/usecase/medical_usecase/generate_qr_usecase.dart';
import '../../../../Domain/usecase/medical_usecase/medical_usecase.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/constant.dart';
import '../../../../data_layer/model/medical_history_dataclass.dart';
import '../../../../data_layer/model/medical_response/MedicalResponse.dart';
import '../../../../data_layer/model/medical_response/qr_resonse/QrMedicalHistoryResponse.dart';

part 'medical_view_model_state.dart';

@injectable
class MedicalViewModelCubit extends Cubit<MedicalViewModelState> {
  final UpdateMedicalHistoryUsecase medicalHistoryUsecase;
  final GenerateQrUsecase generateQrUsecase;

  static MedicalViewModelCubit get(context) => BlocProvider.of(context);

  MedicalViewModelCubit(this.medicalHistoryUsecase, this.generateQrUsecase)
      : super(MedicalViewModelInitial());

  Future<void> sendMedicalHistory({required MedicalHistory patientModel}) async {
    if (!isClosed) emit(MedicalViewModelLoading());

    final response = await medicalHistoryUsecase.call(patientModel: patientModel);

    if (response is SuccessApiResult<MedicalResponse>) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(Constant.medicalHistory, true);

      if (!isClosed) emit(MedicalViewModelSuccess(response.data));

      // بعد النجاح، نولّد QR
      await generateQr();
    } else if (response is ErrorApiResult<MedicalResponse>) {
      if (!isClosed) emit(MedicalViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      if (!isClosed) emit(MedicalViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> generateQr() async {
    final response = await generateQrUsecase.call();

    if (response is SuccessApiResult<QrMedicalHistoryResponse>) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(Constant.qrCodeData, response.data?.qrCodeData ?? "");
      await prefs.setString(Constant.userFriendlyToken, response.data?.userFriendlyToken ?? "");
      print("=================================");
      print(response.data?.userFriendlyToken);
      print("=================================");
      if (!isClosed) emit(GenerateQrSuccess(response.data));
    } else if (response is ErrorApiResult<QrMedicalHistoryResponse>) {
      if (!isClosed) emit(GenerateQrError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      if (!isClosed) emit(GenerateQrError("Unknown error"));
      print("Unknown error");
    }
  }

  @override
  Future<void> close() {
    print("onClose -- MedicalViewModelCubit");
    return super.close();
  }
}
