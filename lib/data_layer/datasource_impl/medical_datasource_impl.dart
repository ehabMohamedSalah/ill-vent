
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/core/cache/shared_pref.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import 'package:injectable/injectable.dart';

import '../../core/constant.dart';
import '../datasource_contract/medical_datasource.dart';
import '../model/medical_history_dataclass.dart';
import '../model/medical_response/MedicalResponse.dart';

@Injectable(as:MedicalDatasource )
class MedicalDatasourceImpl extends MedicalDatasource{
  ApiManager apiManager;
  CacheHelper cacheHelper;
  MedicalDatasourceImpl(this.apiManager,this.cacheHelper);
  @override
  Future<ApiResult<MedicalResponse>> sendPatientData({required MedicalHistory patientModel})async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.postRequest(
          endpoint: Endpoints.medicalhistoryEndpoint,

        body: {
          "command": "string",
          "address": "123 Street, Cairo",
          "bloodType": "AB-",
          "age": 35,
          "weight": 75,
          "height": 170,
          "gender": "Female",
          "hasHighBloodPressure": true,
          "hasLowBloodPressure": false,
          "hasDiabetes": true,
          "diabetesType": "Type 2 Diabetes",
          "medicalConditions": [
            {
              "condition": "Asthma",
              "details": "Mild and seasonal"
            }
          ],
          "hasAllergies": true,
          "allergiesDetails": "Peanuts",
          "familyHistory": {
            "hasCancerPolyps": false,
            "cancerPolypsRelationship": "",
            "hasAnemia": true,
            "anemiaRelationship": "Mother",
            "hasDiabetes": true,
            "diabetesRelationship": "Father",
            "hasBloodClots": false,
            "bloodClotsRelationship": "",
            "hasHeartDisease": true,
            "heartDiseaseRelationship": "Grandfather",
            "hasStroke": false,
            "strokeRelationship": "",
            "hasHighBloodPressure": true,
            "highBloodPressureRelationship": "Mother",
            "hasAnesthesiaReaction": false,
            "anesthesiaReactionRelationship": "",
            "hasBleedingProblems": false,
            "bleedingProblemsRelationship": "",
            "hasHepatitis": false,
            "hepatitisRelationship": "",
            "hasOtherCondition": false,
            "otherConditionDetails": "",
            "otherConditionRelationship": ""
          },
          "hasSurgeryHistory": true,
          "surgicalHistories": [
            {
              "surgeryType": "Appendectomy",
              "date": "2015-08-10T00:00:00Z",
              "details": "Successful, no complications"
            }
          ],
          "birthControlMethod": "Pill",
          "hasBloodTransfusionObjection": false,
          "immunizationHistory": {
            "hasFlu": true,
            "fluDate": "2024-10-01T00:00:00Z",
            "hasTetanus": true,
            "tetanusDate": "2023-09-15T00:00:00Z",
            "hasPneumonia": false,
            "pneumoniaDate": null,
            "hasHepA": true,
            "hepADate": "2022-05-20T00:00:00Z",
            "hasHepB": true,
            "hepBDate": "2022-06-10T00:00:00Z"
          },
          "socialHistory": {
            "exerciseType": "Running",
            "exerciseFrequency": "3 times/week",
            "packsPerDay": 1,
            "yearsSmoked": 5,
            "yearStopped": 2020
          }
        }

        ,
        headers: {
      'Content-Type': 'application/json',

      'Authorization': "Bearer $token",
        },
      );
      var result=MedicalResponse.fromJson(response.data);
      return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }
  
}