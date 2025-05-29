
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/data_layer/datasource_contract/product_datasource.dart';
import 'package:ill_vent/data_layer/model/get_product_response/ProductsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';

@Injectable(as:ProductDatasource )
class ProductDatasourceImpl extends ProductDatasource{
  ApiManager apiManager;
  final CacheHelper cacheHelper;

  ProductDatasourceImpl(this.apiManager,this.cacheHelper);
  @override
  Future<ApiResult<List<ProductsResponse>>> getProducts( ) async{

   try{
     final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
     var response=await apiManager.getRequest(
       Endpoint: Endpoints.getProductsEndpoint,
       headers: {
         'Authorization': "Bearer $token",
       },
     );
     final List dataList = response.data as List;
     final products = dataList
         .map((item) => ProductsResponse.fromJson(item))
         .toList();
     return SuccessApiResult(products);
   }catch(err){
     return ErrorApiResult( Exception(err.toString()));
   }
  }

  @override
  Future<ApiResult<ProductsResponse>> getProductById({required String productId})async {

    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response =await apiManager.getRequest(Endpoint: Endpoints.getProductsByIdEndpoint(productId: productId));
      var product=ProductsResponse.fromJson(response.data);
      return SuccessApiResult(product);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

}