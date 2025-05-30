part of 'delete_view_model_cubit.dart';

@immutable
sealed class DeleteViewModelState {}

final class DeleteViewModelInitial extends DeleteViewModelState {}
///delete order
final class DeleteOrderViewmodelLoading extends DeleteViewModelState {}
final class DeleteOrderViewmodelError extends DeleteViewModelState {
  String err;
  DeleteOrderViewmodelError(this.err);
}
final class DeleteOrderViewmodelSuccess extends DeleteViewModelState {
  DeleteOrderViewmodelSuccess();
}