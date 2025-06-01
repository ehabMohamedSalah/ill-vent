import 'MedicalConditions.dart';
import 'FamilyHistory.dart';
import 'SurgicalHistories.dart';
import 'ImmunizationHistory.dart';
import 'SocialHistory.dart';

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
    this.qrCodeExpiresAt,
  });

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

    familyHistory = json['familyHistory'] != null
        ? FamilyHistory.fromJson(json['familyHistory'])
        : null;

    if (json['surgicalHistories'] != null) {
      surgicalHistories = [];
      json['surgicalHistories'].forEach((v) {
        surgicalHistories?.add(SurgicalHistories.fromJson(v));
      });
    }

    immunizationHistory = json['immunizationHistory'] != null
        ? ImmunizationHistory.fromJson(json['immunizationHistory'])
        : null;

    socialHistory = json['socialHistory'] != null
        ? SocialHistory.fromJson(json['socialHistory'])
        : null;

    qrCode = json['qrCode'];
    qrCodeGeneratedAt = json['qrCodeGeneratedAt'];
    qrCodeExpiresAt = json['qrCodeExpiresAt'];
  }

  String? address;
  String? bloodType;
  num? age;           // here num instead of int
  num? weight;        // num instead of int
  num? height;        // num instead of int
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
      map['medicalConditions'] =
          medicalConditions?.map((v) => v.toJson()).toList();
    }
    if (familyHistory != null) {
      map['familyHistory'] = familyHistory?.toJson();
    }
    if (surgicalHistories != null) {
      map['surgicalHistories'] =
          surgicalHistories?.map((v) => v.toJson()).toList();
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
