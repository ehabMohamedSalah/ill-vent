
import 'package:ill_vent/data_layer/datasource_contract/pharmacy_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/Pharmacy_response.dart';

@injectable
class PharmcyUsecase{
PharmacyDatasource pharmacyDatasource;
PharmcyUsecase(this.pharmacyDatasource);

Future<ApiResult<List<PharmacyResponse>>>  call (){
       return  pharmacyDatasource.getPharmacy();
       }


}