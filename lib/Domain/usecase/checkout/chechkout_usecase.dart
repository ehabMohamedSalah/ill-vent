
import 'package:ill_vent/data_layer/model/dataclasses/chekout_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/datasource_contract/checkout_datasource.dart';
import '../../../data_layer/model/checkout/CheckoutResponse.dart';

@injectable
class ChechkoutUsecase{
  CheckoutDatasource checkoutDatasource;
  ChechkoutUsecase(this.checkoutDatasource);
  Future<ApiResult<CheckoutResponse>> call(CheckoutModel checkoutModel){
    return checkoutDatasource.checkout(checkoutModel);
  }
}