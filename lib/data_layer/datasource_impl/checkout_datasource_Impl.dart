
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/cache/shared_pref.dart';
import 'package:ill_vent/data_layer/datasource_contract/checkout_datasource.dart';
import 'package:ill_vent/data_layer/model/checkout/CheckoutResponse.dart';
import 'package:ill_vent/data_layer/model/checkout/orders/OrdersResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoints.dart';
import '../../core/constant.dart';
import '../model/dataclasses/chekout_model.dart';

@Injectable(as: CheckoutDatasource)
class CheckoutDatasourceImpl extends CheckoutDatasource{
  ApiManager apiManager;
  CacheHelper cacheHelper;
  CheckoutDatasourceImpl(this.apiManager,this.cacheHelper);
  @override
  Future<ApiResult<CheckoutResponse>> checkout(CheckoutModel checkoutModel)async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.postRequest(
          endpoint:Endpoints.chechkout,
        body: {
          "cartItemIds": checkoutModel.cartItemIds,
          "paymentMethod":  checkoutModel.paymentMethod,
          "shippingAddress": checkoutModel.shippingAddress,
          "createOrder": true
        },
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token",
        },);
      var result=CheckoutResponse.fromJson(response.data);
      return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

  @override
  Future<ApiResult<List<OrdersResponse>>> getOrders()async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.getRequest(
        Endpoint:Endpoints.getOrders,
        headers: {
           'Authorization': "Bearer $token",
        },);
      final List dataList = response.data as List;
      final result = dataList.map((item) => OrdersResponse.fromJson(item)).toList();
      return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

  @override
  Future<ApiResult<void>> deleteOrders({required String orderId})async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.postRequest(

        endpoint:Endpoints.deleteOrder(orderId: orderId),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },);
      return SuccessApiResult(null);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

}