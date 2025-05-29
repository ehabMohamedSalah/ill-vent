
import 'package:ill_vent/data_layer/datasource_contract/product_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/get_product_response/ProductsResponse.dart';

@injectable
class ProductUsecase{
  ProductDatasource productDatasource;
  ProductUsecase(this.productDatasource);

  Future<ApiResult<List<ProductsResponse>>> call( ){
    return productDatasource.getProducts( );
  }
}