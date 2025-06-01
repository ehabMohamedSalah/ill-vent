part of 'medical_history_view_model_cubit.dart';

@immutable
sealed class MedicalHistoryViewModelState {}

final class MedicalHistoryViewModelInitial extends MedicalHistoryViewModelState {}
final class MedicalHistoryViewModelLoading extends MedicalHistoryViewModelState {}
final class MedicalHistoryViewModelError extends MedicalHistoryViewModelState {
  String err;
  MedicalHistoryViewModelError(this.err);
}
final class MedicalHistoryViewModelSuccess extends MedicalHistoryViewModelState {
  MedicalResponse? response;
  MedicalHistoryViewModelSuccess(this.response);
}

///getQR
/// QR related states
final class GetQrViewModelLoading extends MedicalHistoryViewModelState {}

final class GetQrError extends MedicalHistoryViewModelState {
  final String err;
  GetQrError(this.err);
}

final class GetQrSuccess extends MedicalHistoryViewModelState {
  final QrMedicalHistoryResponse? response;
  GetQrSuccess(this.response);
}
