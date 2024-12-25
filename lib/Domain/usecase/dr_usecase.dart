import 'package:dartz/dartz.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/Domain/repo_contract/dr_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoctorUsecase{
  DoctorRepo doctorRepo;
  @factoryMethod
  DoctorUsecase(this.doctorRepo);
  Future<Either<List<DrEntity>,String>>call(){
   return doctorRepo.fetchDoctor();
  }
}