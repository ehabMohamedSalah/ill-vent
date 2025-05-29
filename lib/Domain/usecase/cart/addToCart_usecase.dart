
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/datasource_contract/cart_datasource.dart';
import '../../../data_layer/model/cart/AddToCartResponse.dart';

@injectable
class AddToCartUsecase{
  CartDatasource cartDatasource;
  AddToCartUsecase(this.cartDatasource);

  Future<ApiResult<AddToCartResponse>> call({required String productId, required String quantity}){
    return cartDatasource.addToCart(productId: productId, quantity: quantity);
  }
}