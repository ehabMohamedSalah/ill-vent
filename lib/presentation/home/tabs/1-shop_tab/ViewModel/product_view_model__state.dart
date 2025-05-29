part of 'product_view_model__cubit.dart';

@immutable
sealed class ProductViewModelState {}

final class ProductViewModelInitial extends ProductViewModelState {}


/// Get Product ///
final class ProductViewModelLoading extends ProductViewModelState {}
final class ProductViewModelError extends ProductViewModelState {
  String err;
  ProductViewModelError(this.err);
}
final class ProductViewModelSuccess extends ProductViewModelState {
  List<ProductsResponse> products;

  ProductViewModelSuccess(this.products);
}

  /// Get Proudct By ID ///
final class ProductByIdViewModelLoading extends ProductViewModelState {}
final class ProductByIdViewModelError extends ProductViewModelState {
  String err;
  ProductByIdViewModelError(this.err);
}
final class ProductByIdViewModelSuccess extends ProductViewModelState {
   ProductsResponse? product;
  ProductByIdViewModelSuccess(this.product);
}