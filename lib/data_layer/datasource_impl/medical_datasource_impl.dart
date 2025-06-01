
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/core/cache/shared_pref.dart';
import 'package:ill_vent/data_layer/model/medical_response/qr_resonse/QrMedicalHistoryResponse.dart';
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
  Future<ApiResult<MedicalResponse>> sendPatientData({
    required MedicalHistory patientModel,
  }) async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";

      var response = await apiManager.postRequest(
        endpoint: Endpoints.medicalhistoryEndpoint,
        body:{
          "command": "string",
          "address": patientModel.address??"",
          "bloodType": patientModel.bloodType??"AB-",
          "age": patientModel.age??22,
          "weight": patientModel.weight??77,
          "height": patientModel.height??177,
          "gender": patientModel.gender??"Female",

          "hasHighBloodPressure": patientModel.hasHighBloodPressure ?? false,
          "hasLowBloodPressure":
          (patientModel.hasHighBloodPressure ?? false)
              ? false
              : (patientModel.hasLowBloodPressure ?? false),

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
            "hasCancerPolyps": patientModel.familyHistory?.hasCancerPolyps ?? false,
            "cancerPolypsRelationship": (patientModel.familyHistory?.hasCancerPolyps ?? false)
                ? (patientModel.familyHistory?.cancerPolypsRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.cancerPolypsRelationship!
                : "Father")
                : "",

            "hasAnemia": patientModel.familyHistory?.hasAnemia ?? false,
            "anemiaRelationship": (patientModel.familyHistory?.hasAnemia ?? false)
                ? (patientModel.familyHistory?.anemiaRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.anemiaRelationship!
                : "Father")
                : "",

            "hasDiabetes": patientModel.familyHistory?.hasDiabetes ?? false,
            "diabetesRelationship": (patientModel.familyHistory?.hasDiabetes ?? false)
                ? (patientModel.familyHistory?.diabetesRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.diabetesRelationship!
                : "Father")
                : "",

            "hasBloodClots": patientModel.familyHistory?.hasBloodClots ?? false,
            "bloodClotsRelationship": (patientModel.familyHistory?.hasBloodClots ?? false)
                ? (patientModel.familyHistory?.bloodClotsRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.bloodClotsRelationship!
                : "Father")
                : "",

            "hasHeartDisease": patientModel.familyHistory?.hasHeartDisease ?? false,
            "heartDiseaseRelationship": (patientModel.familyHistory?.hasHeartDisease ?? false)
                ? (patientModel.familyHistory?.heartDiseaseRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.heartDiseaseRelationship!
                : "Father")
                : "",

            "hasStroke": patientModel.familyHistory?.hasStroke ?? false,
            "strokeRelationship": (patientModel.familyHistory?.hasStroke ?? false)
                ? (patientModel.familyHistory?.strokeRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.strokeRelationship!
                : "Father")
                : "",

            "hasHighBloodPressure": patientModel.familyHistory?.hasHighBloodPressure ?? false,
            "highBloodPressureRelationship": (patientModel.familyHistory?.hasHighBloodPressure ?? false)
                ? (patientModel.familyHistory?.highBloodPressureRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.highBloodPressureRelationship!
                : "Father")
                : "",

            "hasAnesthesiaReaction": patientModel.familyHistory?.hasAnesthesiaReaction ?? false,
            "anesthesiaReactionRelationship": (patientModel.familyHistory?.hasAnesthesiaReaction ?? false)
                ? (patientModel.familyHistory?.anesthesiaReactionRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.anesthesiaReactionRelationship!
                : "Father")
                : "",

            "hasBleedingProblems": patientModel.familyHistory?.hasBleedingProblems ?? false,
            "bleedingProblemsRelationship": (patientModel.familyHistory?.hasBleedingProblems ?? false)
                ? (patientModel.familyHistory?.bleedingProblemsRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.bleedingProblemsRelationship!
                : "Father")
                : "",

            "hasHepatitis": patientModel.familyHistory?.hasHepatitis ?? false,
            "hepatitisRelationship": (patientModel.familyHistory?.hasHepatitis ?? false)
                ? (patientModel.familyHistory?.hepatitisRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.hepatitisRelationship!
                : "Father")
                : "",

            "hasOtherCondition": patientModel.familyHistory?.hasOtherCondition ?? false,
            "otherConditionDetails": (patientModel.familyHistory?.hasOtherCondition ?? false)
                ? (patientModel.familyHistory?.otherConditionDetails?.isNotEmpty == true
                ? patientModel.familyHistory!.otherConditionDetails!
                : "Some condition")
                : "",
            "otherConditionRelationship": (patientModel.familyHistory?.hasOtherCondition ?? false)
                ? (patientModel.familyHistory?.otherConditionRelationship?.isNotEmpty == true
                ? patientModel.familyHistory!.otherConditionRelationship!
                : "Father")
                : ""
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
            "hasFlu": patientModel.immunizationHistory?.hasFlu ?? false,
            "fluDate": (patientModel.immunizationHistory?.hasFlu ?? false &&
                patientModel.immunizationHistory?.fluDate != null)
                ? patientModel.immunizationHistory!.fluDate!.toUtc().toIso8601String()
                : null,

            "hasTetanus": patientModel.immunizationHistory?.hasTetanus ?? false,
            "tetanusDate": (patientModel.immunizationHistory?.hasTetanus ?? false &&
                patientModel.immunizationHistory?.tetanusDate != null)
                ? patientModel.immunizationHistory!.tetanusDate!.toUtc().toIso8601String()
                : null,

            "hasPneumonia": patientModel.immunizationHistory?.hasPneumonia ?? false,
            "pneumoniaDate": (patientModel.immunizationHistory?.hasPneumonia ?? false &&
                patientModel.immunizationHistory?.pneumoniaDate != null)
                ? patientModel.immunizationHistory!.pneumoniaDate!.toUtc().toIso8601String()
                : null,

            "hasHepA": patientModel.immunizationHistory?.hasHepA ?? false,
            "hepADate": (patientModel.immunizationHistory?.hasHepA ?? false &&
                patientModel.immunizationHistory?.hepADate != null)
                ? patientModel.immunizationHistory!.hepADate!.toUtc().toIso8601String()
                : null,

            "hasHepB": patientModel.immunizationHistory?.hasHepB ?? false,
            "hepBDate": (patientModel.immunizationHistory?.hasHepB ?? false &&
                patientModel.immunizationHistory?.hepBDate != null)
                ? patientModel.immunizationHistory!.hepBDate!.toUtc().toIso8601String()
                : null,
          },


          "socialHistory": {
            "exerciseType": patientModel.socialHistory?.exerciseType??"",
            "exerciseFrequency": patientModel.socialHistory?.exerciseFrequency??"",
            "packsPerDay": 1,
            "yearsSmoked": 5,
            "yearStopped": 2020
          }
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        },
      );

      var result = MedicalResponse.fromJson(response.data);
      return SuccessApiResult(result);
    } catch (err) {
      return ErrorApiResult(Exception(err.toString()));
    }
  }

  @override
  Future<ApiResult<QrMedicalHistoryResponse>> generateQr() async{
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await  apiManager.getRequest(
            Endpoint: Endpoints.qrMedicalhistoryEndpoint,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        );
        var result= QrMedicalHistoryResponse.fromJson(response.data);
        return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }
  
}