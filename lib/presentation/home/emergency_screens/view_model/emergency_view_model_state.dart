part of 'emergency_view_model_cubit.dart';

@immutable
abstract class EmergencyViewModelState {}

class EmergencyViewModelInitial extends EmergencyViewModelState {}

class EmergencyViewModelLoading extends EmergencyViewModelState {}

class EmergencyViewModelSuccess extends EmergencyViewModelState {
  final EmergencyRequestResponse? response;
  EmergencyViewModelSuccess(this.response);
}

class EmergencyViewModelError extends EmergencyViewModelState {
  final String message;
  EmergencyViewModelError(this.message);
}


///EmergencyStatusLoading
class EmergencyStatusLoading extends EmergencyViewModelState {}

class EmergencyStatusSuccess extends EmergencyViewModelState {
  final EmergencyStatusResponse statusResponse;
  EmergencyStatusSuccess(this.statusResponse);
}

class EmergencyStatusError extends EmergencyViewModelState {
  final String message;
  EmergencyStatusError(this.message);
}


///hospital Found
class HospitalFound extends EmergencyViewModelState {
  EmergencyStatusResponse hospitalData;
  HospitalFound(this.hospitalData);
}


///Complete Emergency Request
class CompleteEmergencyLoading extends EmergencyViewModelState {}
class CompleteEmergencySuccess extends EmergencyViewModelState {
  final CompleteRequestResponse? Response;
  CompleteEmergencySuccess(this.Response);
}

class CompleteEmergencyError extends EmergencyViewModelState {
  final String message;
  CompleteEmergencyError(this.message);
}
