import 'package:dartz/dartz.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';


abstract class DoctorRepo{
  Future<Either<List<DrEntity>, String>> fetchDoctor();

}