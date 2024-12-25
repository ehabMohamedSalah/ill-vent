import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class ModelService {

  Future<List<dynamic>> loadDoctors() async {
    try {
      final jsonData = await rootBundle.loadString('assets/DummyData/dr.json');
      final List<dynamic> data = json.decode(jsonData);
      return data;
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }
}
