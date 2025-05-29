
import 'package:ill_vent/data_layer/datasource_contract/cart_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';

@injectable
class DeleteCartItemUsecase{
  CartDatasource cartDatasource;
  DeleteCartItemUsecase (this.cartDatasource);

  Future<ApiResult<void>> call({required String cartItemId}){
    return cartDatasource.deleteCartItem(cartItemId: cartItemId);
  }
}