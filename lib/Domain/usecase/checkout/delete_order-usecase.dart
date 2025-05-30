
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/datasource_contract/checkout_datasource.dart';
import '../../../data_layer/model/checkout/orders/OrdersResponse.dart';

@injectable
class DeleteOrderUsecase{
  CheckoutDatasource checkoutDatasource;
  DeleteOrderUsecase(this.checkoutDatasource);

  Future<ApiResult<void>> call({required String orderId}){
    return checkoutDatasource.deleteOrders(orderId: orderId);
  }
}