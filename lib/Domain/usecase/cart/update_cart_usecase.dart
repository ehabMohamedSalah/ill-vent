
import 'package:ill_vent/data_layer/datasource_contract/cart_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart' show ApiResult;
import '../../../data_layer/model/cart/CartResponse.dart';

@injectable
class UpdateCartUsecase{
  CartDatasource cartDatasource;
  UpdateCartUsecase(this.cartDatasource);

  Future<ApiResult<CartResponse>> call({required String productId, required String quantity}){
    return cartDatasource.updateCartItem(productId: productId, quantity: quantity);
  }
}