
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/checkout/CheckoutResponse.dart';

import '../model/checkout/orders/OrdersResponse.dart';
import '../model/dataclasses/chekout_model.dart';

abstract class CheckoutDatasource{
  Future<ApiResult<CheckoutResponse>> checkout(CheckoutModel checkoutModel);
  Future<ApiResult<List<OrdersResponse>>> getOrders();
  Future<ApiResult<void>> deleteOrders({required String orderId});
}