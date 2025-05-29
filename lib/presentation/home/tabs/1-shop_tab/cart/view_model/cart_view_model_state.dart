part of 'cart_view_model_cubit.dart';

@immutable
sealed class CartViewModelState {}

final class CartViewModelInitial extends CartViewModelState {}

/// Add To Cart ///
final class AddToCartViewModelLoading extends CartViewModelState {}

final class AddToCartViewModelError extends CartViewModelState {
  final String err;
  AddToCartViewModelError(this.err);
}

final class AddToCartViewModelSuccess extends CartViewModelState {
  final AddToCartResponse? addToCartResponse;
  AddToCartViewModelSuccess(this.addToCartResponse);
}

/// Get Cart ///
final class GetCartViewModelLoading extends CartViewModelState {}

final class GetCartViewModelError extends CartViewModelState {
  final String err;
  GetCartViewModelError(this.err);
}

final class GetCartViewModelSuccess extends CartViewModelState {
  final List<CartResponse>? listProducts;
  final num total;


  GetCartViewModelSuccess(this.listProducts ,this.total);
}

/// Update Cart ///
final class UpdateCartViewModelLoading extends CartViewModelState {}

final class UpdateCartViewModelError extends CartViewModelState {
  final String err;
  UpdateCartViewModelError(this.err);
}

final class UpdateCartViewModelSuccess extends CartViewModelState {
  final CartResponse? product;


  UpdateCartViewModelSuccess(this.product );
}
