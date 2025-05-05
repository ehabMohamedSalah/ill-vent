part of 'available_time_cubit.dart';

@immutable
sealed class AvailableTimeState {}

final class AvailableTimeInitial extends AvailableTimeState {}
class AvailableTimeLoading extends AvailableTimeState{}
class AvailableTimeError extends AvailableTimeState{
  String errorMsg;
  AvailableTimeError(this.errorMsg);
}
class AvailableTimeSuccess extends AvailableTimeState{
  List<AvailableTimeResponse> times;
  AvailableTimeSuccess(this.times);
}