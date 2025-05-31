part of 'medical_view_model_cubit.dart';

@immutable
sealed class MedicalViewModelState {}

final class MedicalViewModelInitial extends MedicalViewModelState {}
final class MedicalViewModelLoading extends MedicalViewModelState {}
final class MedicalViewModelError extends MedicalViewModelState {
  String err;
  MedicalViewModelError(this.err);
}
final class MedicalViewModelSuccess extends MedicalViewModelState {
  MedicalResponse? response;
  MedicalViewModelSuccess(this.response);
}
