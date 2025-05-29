
import 'package:ill_vent/data_layer/datasource_contract/product_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/get_product_response/ProductsResponse.dart';

@injectable
class GetProductByIdUsecase{
ProductDatasource productDatasource;
GetProductByIdUsecase(this.productDatasource);

Future<ApiResult<ProductsResponse>>  call({required String productId}){
  return productDatasource.getProductById(productId: productId);
}
}