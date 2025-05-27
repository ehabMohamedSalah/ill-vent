part of 'dr_view_model_cubit.dart';

@immutable
sealed class DrViewModelState {}

final class DrViewModelInitial extends DrViewModelState {}
class DrLoading extends DrViewModelState{}
class DrError extends DrViewModelState{
  String errorMsg;
  DrError(this.errorMsg);
}
class DrSuccess extends DrViewModelState{
  List<GetDrResponse> drEntity;
  DrSuccess(this.drEntity);
}


//create appointment
class CreateAppointMentLoading extends DrViewModelState{}
class CreateAppointMentError extends DrViewModelState{
  String errorMsg;
  CreateAppointMentError(this.errorMsg);
}
class CreateAppointMentSuccess extends DrViewModelState{
  CreateAppointmentResponse? appointment;
  CreateAppointMentSuccess(this.appointment);
}

class GetAppointmentLoading extends  DrViewModelState{}
class GetAppointmentError extends  DrViewModelState{
  String errorMsg;
  GetAppointmentError(this.errorMsg);
}
class GetAppointmentSuccess extends  DrViewModelState{
 List<GetUserAppointmentResponse> ? appointment;
  GetAppointmentSuccess(this.appointment);
}

class CancelAppointmentLoading extends DrViewModelState{}
class CancelAppointmentError extends DrViewModelState{
  String errMsg;
  CancelAppointmentError(this.errMsg);
}
class CancelAppointmentSuccess extends DrViewModelState{
  CancelAppointmentResponse? response;
  CancelAppointmentSuccess(this.response);
}
