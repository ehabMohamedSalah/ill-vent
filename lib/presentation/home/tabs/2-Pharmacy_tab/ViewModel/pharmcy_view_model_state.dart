part of 'pharmcy_view_model_cubit.dart';

@immutable
sealed class PharmcyViewModelState {}

final class PharmcyViewModelInitial extends PharmcyViewModelState {}
final class PharmcyViewModelLoading extends PharmcyViewModelState {}
final class PharmcyViewModelError extends PharmcyViewModelState {
  String message;
  PharmcyViewModelError(this.message);
}
final class PharmcyViewModelSuccess extends PharmcyViewModelState {
  List<PharmacyResponse> response;
  PharmcyViewModelSuccess(this.response);
}
class PharmcyViewModelNoData extends PharmcyViewModelState {
  final String message;
  PharmcyViewModelNoData(this.message);
}
