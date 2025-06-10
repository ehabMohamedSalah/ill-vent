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

// حالة خاصة بتحميل حالة الطوارئ (الانتظار لاستلام تحديثات)
class EmergencyStatusLoading extends EmergencyViewModelState {}

// حالة استلام تحديث من المستشفى (لكن الحالة ليست Completed)
class EmergencyStatusUpdated extends EmergencyViewModelState {
  final EmergencyStatusResponse statusResponse;
  EmergencyStatusUpdated(this.statusResponse);
}
class EmergencyStatusError extends EmergencyViewModelState {
  final String message;
  EmergencyStatusError(this.message);
}


// حالة نجاح عند الوصول لحالة Completed (أي المستشفى تم إيجاده)
class HospitalFound extends EmergencyViewModelState {
  final EmergencyStatusResponse hospitalResponse;
  HospitalFound(this.hospitalResponse);
}

// حالات اكتمال الطلب
class CompleteEmergencyLoading extends EmergencyViewModelState {}

class CompleteEmergencySuccess extends EmergencyViewModelState {
  final CompleteRequestResponse? response;
  CompleteEmergencySuccess(this.response);
}

class CompleteEmergencyError extends EmergencyViewModelState {
  final String message;
  CompleteEmergencyError(this.message);
}
class EmergencyStatusRejected extends EmergencyViewModelState {
  final EmergencyStatusResponse? response;

  EmergencyStatusRejected(this.response);
}

