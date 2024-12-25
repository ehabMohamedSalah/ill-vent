import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:flutter/services.dart';
import 'package:ill_vent/data_layer/model/Dr_model.dart';
import 'package:injectable/injectable.dart';
import '../../core/ModelService.dart';
import '../datasource_contract/dr_datasource_contract.dart';


@Injectable(as: DoctorDatasourceContract)
class DoctorDatasourceImpl extends DoctorDatasourceContract {
  ModelService modelService;
  @factoryMethod
  DoctorDatasourceImpl(this.modelService);

  @override
  Future<Either<List<DrModel>, String>> fetchDoctor() async {
    try {
      final jsonData = await modelService.loadDoctors();
      final productsModel = jsonData.map((item) => DrModel.fromJson(item)).toList();
      return left(productsModel);
    } catch (error) {
      return right(error.toString());
    }
  }
}
