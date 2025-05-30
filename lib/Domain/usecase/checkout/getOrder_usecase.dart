
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/datasource_contract/checkout_datasource.dart';
import '../../../data_layer/model/checkout/orders/OrdersResponse.dart';

@injectable
class GetOrderUsecase{
  CheckoutDatasource checkoutDatasource;
  GetOrderUsecase(this.checkoutDatasource);
  Future<ApiResult<List<OrdersResponse>>>  call(){
    return checkoutDatasource.getOrders();
  }
}