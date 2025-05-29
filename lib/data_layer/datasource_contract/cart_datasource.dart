
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/cart/AddToCartResponse.dart';
import 'package:ill_vent/data_layer/model/cart/CartResponse.dart';

abstract class CartDatasource{
  Future<ApiResult<AddToCartResponse>> addToCart({required String productId, required String quantity});
  Future<ApiResult<List<CartResponse>>> Cart();
  Future<ApiResult<CartResponse>> updateCartItem({required String productId,required String quantity});
  Future<ApiResult<void>> deleteCartItem({required String cartItemId});
}