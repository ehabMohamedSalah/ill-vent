import 'package:dartz/dartz.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/data_layer/datasource_contract/dr_datasource_contract.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/repo_contract/dr_repo.dart';

@Injectable(as: DoctorRepo)
class DoctorRepoImpl extends DoctorRepo{
  DoctorDatasourceContract dummyDatasource;
  DoctorRepoImpl({required this.dummyDatasource});
  @override
  Future<Either<List<DrEntity>, String>> fetchDoctor() async{
    var response=await dummyDatasource.fetchDoctor();
    return response.fold(
            (DoctorModel) {
              var DoctorEntity=DoctorModel.map((doctor) => doctor.toDrEntity()).toList();
              return left(DoctorEntity);
            },
            (error) {
              return right(error.toString());
            }
    );
  }

}