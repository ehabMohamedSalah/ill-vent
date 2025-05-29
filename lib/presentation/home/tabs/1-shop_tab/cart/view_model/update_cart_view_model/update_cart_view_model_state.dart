part of 'update_cart_view_model_cubit.dart';

@immutable
sealed class UpdateCartViewModelState {}

final class UpdateCartViewModelInitial extends UpdateCartViewModelState {}

///update Cart///
final class UpdateCartViewModelLoading extends UpdateCartViewModelState {}
final class  UpdateCartViewModelError extends UpdateCartViewModelState {
  String err;
  UpdateCartViewModelError(this.err);
}
final class UpdateCartViewModelSuccess extends UpdateCartViewModelState {
  CartResponse? product;
  UpdateCartViewModelSuccess(this.product);
}