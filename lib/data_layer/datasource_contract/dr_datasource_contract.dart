
import 'package:dartz/dartz.dart';

import '../model/Dr_model.dart';

abstract class DoctorDatasourceContract{
  Future<Either<List<DrModel>, String>> fetchDoctor();
}