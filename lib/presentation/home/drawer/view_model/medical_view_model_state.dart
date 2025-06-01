part of 'medical_view_model_cubit.dart';

@immutable
sealed class MedicalViewModelState {}

final class MedicalViewModelInitial extends MedicalViewModelState {}

final class MedicalViewModelLoading extends MedicalViewModelState {}

final class MedicalViewModelError extends MedicalViewModelState {
  final String err;
  MedicalViewModelError(this.err);
}

final class MedicalViewModelSuccess extends MedicalViewModelState {
  final MedicalResponse? response;
  MedicalViewModelSuccess(this.response);
}

/// QR related states
final class GenerateQrViewModelLoading extends MedicalViewModelState {}

final class GenerateQrError extends MedicalViewModelState {
  final String err;
  GenerateQrError(this.err);
}

final class GenerateQrSuccess extends MedicalViewModelState {
  final QrMedicalHistoryResponse? response;
  GenerateQrSuccess(this.response);
}
