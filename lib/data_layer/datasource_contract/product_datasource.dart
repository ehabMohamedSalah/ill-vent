

import '../../core/api/api_result.dart';
import '../model/get_product_response/ProductsResponse.dart';

abstract class ProductDatasource{
  Future<ApiResult<List<ProductsResponse>>> getProducts( );
  Future<ApiResult<ProductsResponse>> getProductById({required String productId} );
}