
import 'package:ill_vent/data_layer/datasource_contract/cart_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/cart/CartResponse.dart';

@injectable
class CartUsecase{
  CartDatasource cartDatasource;
  CartUsecase(this.cartDatasource);

  Future<ApiResult<List<CartResponse>>> call(){
   return cartDatasource.Cart();
  }

}