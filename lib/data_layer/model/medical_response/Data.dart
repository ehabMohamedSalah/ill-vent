import 'MedicalConditions.dart';
import 'FamilyHistory.dart';
import 'SurgicalHistories.dart';
import 'ImmunizationHistory.dart';
import 'SocialHistory.dart';

/// address : "123 Street, Cairo"
/// bloodType : "AB-"
/// age : 35
/// weight : 75
/// height : 170
/// gender : "Female"
/// hasHighBloodPressure : true
/// hasLowBloodPressure : false
/// hasDiabetes : true
/// diabetesType : "Type 2 Diabetes"
/// hasAllergies : true
/// allergiesDetails : "Peanuts"
/// hasSurgeryHistory : true
/// birthControlMethod : "Pill"
/// hasBloodTransfusionObjection : false
/// medicalConditions : [{"condition":"Asthma","details":"Mild and seasonal"}]
/// familyHistory : {"hasCancerPolyps":false,"hasAnemia":true,"anemiaRelationship":"Mother","hasDiabetes":true,"diabetesRelationship":"Father","hasBloodClots":false,"hasHeartDisease":true,"heartDiseaseRelationship":"Grandfather","hasStroke":false,"hasHighBloodPressure":true,"highBloodPressureRelationship":"Mother","hasAnesthesiaReaction":false,"hasBleedingProblems":false,"hasHepatitis":false,"hasOtherCondition":false}
/// surgicalHistories : [{"surgeryType":"Appendectomy","date":"2015-08-10T00:00:00Z","details":"Successful, no complications"}]
/// immunizationHistory : {"hasFlu":true,"fluDate":"2024-10-01T00:00:00Z","hasTetanus":true,"tetanusDate":"2023-09-15T00:00:00Z","hasPneumonia":false,"hasHepA":true,"hepADate":"2022-05-20T00:00:00Z","hasHepB":true,"hepBDate":"2022-06-10T00:00:00Z"}
/// socialHistory : {"exerciseType":"Running","exerciseFrequency":"3 times/week","packsPerDay":1,"yearsSmoked":5,"yearStopped":2020}
/// qrCode : "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"
/// qrCodeGeneratedAt : "2025-05-22T17:24:22.6751027"
/// qrCodeExpiresAt : "2026-05-22T17:24:22.675103"

class Data {
  Data({
      this.address, 
      this.bloodType, 
      this.age, 
      this.weight, 
      this.height, 
      this.gender, 
      this.hasHighBloodPressure, 
      this.hasLowBloodPressure, 
      this.hasDiabetes, 
      this.diabetesType, 
      this.hasAllergies, 
      this.allergiesDetails, 
      this.hasSurgeryHistory, 
      this.birthControlMethod, 
      this.hasBloodTransfusionObjection, 
      this.medicalConditions, 
      this.familyHistory, 
      this.surgicalHistories, 
      this.immunizationHistory, 
      this.socialHistory, 
      this.qrCode, 
      this.qrCodeGeneratedAt, 
      this.qrCodeExpiresAt,});

  Data.fromJson(dynamic json) {
    address = json['address'];
    bloodType = json['bloodType'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    gender = json['gender'];
    hasHighBloodPressure = json['hasHighBloodPressure'];
    hasLowBloodPressure = json['hasLowBloodPressure'];
    hasDiabetes = json['hasDiabetes'];
    diabetesType = json['diabetesType'];
    hasAllergies = json['hasAllergies'];
    allergiesDetails = json['allergiesDetails'];
    hasSurgeryHistory = json['hasSurgeryHistory'];
    birthControlMethod = json['birthControlMethod'];
    hasBloodTransfusionObjection = json['hasBloodTransfusionObjection'];
    if (json['medicalConditions'] != null) {
      medicalConditions = [];
      json['medicalConditions'].forEach((v) {
        medicalConditions?.add(MedicalConditions.fromJson(v));
      });
    }
    familyHistory = json['familyHistory'] != null ? FamilyHistory.fromJson(json['familyHistory']) : null;
    if (json['surgicalHistories'] != null) {
      surgicalHistories = [];
      json['surgicalHistories'].forEach((v) {
        surgicalHistories?.add(SurgicalHistories.fromJson(v));
      });
    }
    immunizationHistory = json['immunizationHistory'] != null ? ImmunizationHistory.fromJson(json['immunizationHistory']) : null;
    socialHistory = json['socialHistory'] != null ? SocialHistory.fromJson(json['socialHistory']) : null;
    qrCode = json['qrCode'];
    qrCodeGeneratedAt = json['qrCodeGeneratedAt'];
    qrCodeExpiresAt = json['qrCodeExpiresAt'];
  }
  String? address;
  String? bloodType;
  int? age;
  int? weight;
  int? height;
  String? gender;
  bool? hasHighBloodPressure;
  bool? hasLowBloodPressure;
  bool? hasDiabetes;
  String? diabetesType;
  bool? hasAllergies;
  String? allergiesDetails;
  bool? hasSurgeryHistory;
  String? birthControlMethod;
  bool? hasBloodTransfusionObjection;
  List<MedicalConditions>? medicalConditions;
  FamilyHistory? familyHistory;
  List<SurgicalHistories>? surgicalHistories;
  ImmunizationHistory? immunizationHistory;
  SocialHistory? socialHistory;
  String? qrCode;
  String? qrCodeGeneratedAt;
  String? qrCodeExpiresAt;
Data copyWith({  String? address,
  String? bloodType,
  int? age,
  int? weight,
  int? height,
  String? gender,
  bool? hasHighBloodPressure,
  bool? hasLowBloodPressure,
  bool? hasDiabetes,
  String? diabetesType,
  bool? hasAllergies,
  String? allergiesDetails,
  bool? hasSurgeryHistory,
  String? birthControlMethod,
  bool? hasBloodTransfusionObjection,
  List<MedicalConditions>? medicalConditions,
  FamilyHistory? familyHistory,
  List<SurgicalHistories>? surgicalHistories,
  ImmunizationHistory? immunizationHistory,
  SocialHistory? socialHistory,
  String? qrCode,
  String? qrCodeGeneratedAt,
  String? qrCodeExpiresAt,
}) => Data(  address: address ?? this.address,
  bloodType: bloodType ?? this.bloodType,
  age: age ?? this.age,
  weight: weight ?? this.weight,
  height: height ?? this.height,
  gender: gender ?? this.gender,
  hasHighBloodPressure: hasHighBloodPressure ?? this.hasHighBloodPressure,
  hasLowBloodPressure: hasLowBloodPressure ?? this.hasLowBloodPressure,
  hasDiabetes: hasDiabetes ?? this.hasDiabetes,
  diabetesType: diabetesType ?? this.diabetesType,
  hasAllergies: hasAllergies ?? this.hasAllergies,
  allergiesDetails: allergiesDetails ?? this.allergiesDetails,
  hasSurgeryHistory: hasSurgeryHistory ?? this.hasSurgeryHistory,
  birthControlMethod: birthControlMethod ?? this.birthControlMethod,
  hasBloodTransfusionObjection: hasBloodTransfusionObjection ?? this.hasBloodTransfusionObjection,
  medicalConditions: medicalConditions ?? this.medicalConditions,
  familyHistory: familyHistory ?? this.familyHistory,
  surgicalHistories: surgicalHistories ?? this.surgicalHistories,
  immunizationHistory: immunizationHistory ?? this.immunizationHistory,
  socialHistory: socialHistory ?? this.socialHistory,
  qrCode: qrCode ?? this.qrCode,
  qrCodeGeneratedAt: qrCodeGeneratedAt ?? this.qrCodeGeneratedAt,
  qrCodeExpiresAt: qrCodeExpiresAt ?? this.qrCodeExpiresAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['bloodType'] = bloodType;
    map['age'] = age;
    map['weight'] = weight;
    map['height'] = height;
    map['gender'] = gender;
    map['hasHighBloodPressure'] = hasHighBloodPressure;
    map['hasLowBloodPressure'] = hasLowBloodPressure;
    map['hasDiabetes'] = hasDiabetes;
    map['diabetesType'] = diabetesType;
    map['hasAllergies'] = hasAllergies;
    map['allergiesDetails'] = allergiesDetails;
    map['hasSurgeryHistory'] = hasSurgeryHistory;
    map['birthControlMethod'] = birthControlMethod;
    map['hasBloodTransfusionObjection'] = hasBloodTransfusionObjection;
    if (medicalConditions != null) {
      map['medicalConditions'] = medicalConditions?.map((v) => v.toJson()).toList();
    }
    if (familyHistory != null) {
      map['familyHistory'] = familyHistory?.toJson();
    }
    if (surgicalHistories != null) {
      map['surgicalHistories'] = surgicalHistories?.map((v) => v.toJson()).toList();
    }
    if (immunizationHistory != null) {
      map['immunizationHistory'] = immunizationHistory?.toJson();
    }
    if (socialHistory != null) {
      map['socialHistory'] = socialHistory?.toJson();
    }
    map['qrCode'] = qrCode;
    map['qrCodeGeneratedAt'] = qrCodeGeneratedAt;
    map['qrCodeExpiresAt'] = qrCodeExpiresAt;
    return map;
  }

}