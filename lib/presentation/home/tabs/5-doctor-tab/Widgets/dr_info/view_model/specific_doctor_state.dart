part of 'specific_doctor_cubit.dart';

@immutable
sealed class SpecificDoctorState {}

final class SpecificDoctorInitial extends SpecificDoctorState {}
class SpecificDrLoading extends SpecificDoctorState{}
class SpecificDrError extends SpecificDoctorState{
  String errorMsg;
  SpecificDrError(this.errorMsg);
}
class SpecificDrSuccess extends SpecificDoctorState{
  GetDrByIdResponse? drEntity;
  SpecificDrSuccess(this.drEntity);
}
