
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/data_layer/datasource_contract/cart_datasource.dart';
import 'package:ill_vent/data_layer/model/cart/AddToCartResponse.dart';
import 'package:ill_vent/data_layer/model/cart/CartResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';

@Injectable(as:CartDatasource )
class CartDatasourceImpl extends CartDatasource{
  ApiManager apiManager;
  final CacheHelper cacheHelper;
  CartDatasourceImpl(this.apiManager,this.cacheHelper);

  @override
  Future<ApiResult<AddToCartResponse>> addToCart({required String productId, required String quantity}) async{

    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.postRequest(
        endpoint: Endpoints.addToCart(productId: productId, quantity: quantity),
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      var result=AddToCartResponse.fromJson(response.data);
      return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err));
    }
  }

  @override
  Future<ApiResult<List<CartResponse>>> Cart()async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.getRequest(Endpoint: Endpoints.cartEndpoint,headers: {
        'Authorization': "Bearer $token",
      },);
      final List dataList = response.data as List;
      final products = dataList.map((item) => CartResponse.fromJson(item)).toList();

      return SuccessApiResult(products);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateCartItem({required String productId, required String quantity})async {
   try{
     final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
     var response= await apiManager.put(
       Endpoint: Endpoints.updateCartItem(id: productId,quantity: quantity),
       headers: {
         'Authorization': "Bearer $token",
       },
     );
        var data = CartResponse.fromJson(response.data) ;

     return SuccessApiResult(data);
   }catch(err){
     return ErrorApiResult(Exception(err.toString()));
   }
  }

  @override
  Future<ApiResult<void>> deleteCartItem({required String cartItemId}) async{
     try{
       final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
       var response=await apiManager.delete(
           Endpoint: Endpoints.deleteCartItem(cartItemId: cartItemId),
         headers: {
           'Authorization': "Bearer $token",
         },);
       var result= CartResponse.fromJson(response.data);
       return SuccessApiResult(result);
     }catch(err){
       return ErrorApiResult(Exception(err.toString()));
     }
  }


}
