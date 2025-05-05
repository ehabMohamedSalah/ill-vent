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