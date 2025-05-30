part of 'chechkout_viewmodel_cubit.dart';

@immutable
sealed class ChechkoutViewmodelState {}

final class ChechkoutViewmodelInitial extends ChechkoutViewmodelState {}

///chechout
final class ChechkoutViewmodelLoading extends ChechkoutViewmodelState {}
final class ChechkoutViewmodelError extends ChechkoutViewmodelState {
  String err;
  ChechkoutViewmodelError(this.err);
}
final class ChechkoutViewmodelSuccess extends ChechkoutViewmodelState {
  CheckoutResponse? response;
  ChechkoutViewmodelSuccess(this.response);
}

///Get Order
final class GetorderViewmodelLoading extends ChechkoutViewmodelState {}
final class GetorderViewmodelError extends ChechkoutViewmodelState {
  String err;
  GetorderViewmodelError(this.err);
}
final class GetorderViewmodelSuccess extends ChechkoutViewmodelState {
 List<OrdersResponse>? response;
  GetorderViewmodelSuccess(this.response);
}


