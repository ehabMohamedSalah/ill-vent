part of 'hospital_view_model_cubit.dart';

@immutable
sealed class HospitalViewModelState {}

final class HospitalViewModelInitial extends HospitalViewModelState {}
final class HospitalViewModelLoading extends HospitalViewModelState {}
final class HospitalViewModelSuccess extends HospitalViewModelState {
  List<HospitalResponse> response;
  HospitalViewModelSuccess(this.response);
}
final class HospitalViewModelError extends HospitalViewModelState {
  String errorMsg;
  HospitalViewModelError(this.errorMsg);
}

