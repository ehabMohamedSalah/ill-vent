import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/cart/addToCart_usecase.dart';
import 'package:ill_vent/Domain/usecase/cart/cart_usecase.dart';
import 'package:ill_vent/Domain/usecase/cart/update_cart_usecase.dart';
import 'package:ill_vent/data_layer/model/cart/AddToCartResponse.dart';
import 'package:ill_vent/data_layer/model/cart/CartResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/api_result.dart';

part 'cart_view_model_state.dart';

@injectable
class CartViewModelCubit extends Cubit<CartViewModelState> {
  static CartViewModelCubit get(context) => BlocProvider.of(context);

  AddToCartUsecase addToCartUsecase;
  CartUsecase cartUsecase;

  List<CartResponse> cartItems = [];
  num total = 0;

  CartViewModelCubit(this.addToCartUsecase, this.cartUsecase)
      : super(CartViewModelInitial());

  Future<void> addToCart({
    required String productId,
    required String quantity,
  }) async {
    emit(AddToCartViewModelLoading());
    var response =
    await addToCartUsecase.call(productId: productId, quantity: quantity);
    if (response is SuccessApiResult<AddToCartResponse>) {
      emit(AddToCartViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<AddToCartResponse>) {
      emit(AddToCartViewModelError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(AddToCartViewModelError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> getCart() async {
    emit(GetCartViewModelLoading());
    var response = await cartUsecase.call();
    if (response is SuccessApiResult<List<CartResponse>>) {
      cartItems = response.data ?? [];
      calculateTotal();
      emit(GetCartViewModelSuccess(cartItems, total));
    } else if (response is ErrorApiResult<List<CartResponse>>) {
      emit(GetCartViewModelError(response.exception.toString()));
    } else {
      emit(GetCartViewModelError("Unknown error"));
    }
  }

  void removeItemFromCartLocally(String cartItemId) {
    cartItems.removeWhere((item) => item.cartItemId.toString() == cartItemId);
    calculateTotal();
    emit(GetCartViewModelSuccess(List.from(cartItems), total));
  }

  void updateQuantityLocally({
    required String cartItemId,
    required int newQuantity,
  }) {
    final index = cartItems.indexWhere(
            (item) => item.cartItemId.toString() == cartItemId);
    if (index != -1) {
      cartItems[index].quantity = newQuantity;
      calculateTotal();
      emit(GetCartViewModelSuccess(List.from(cartItems), total));
    }
  }

  void calculateTotal() {
    total = 0;
    for (var item in cartItems) {
      total += (item.productPrice ?? 0) * (item.quantity ?? 0);
    }
  }
}
