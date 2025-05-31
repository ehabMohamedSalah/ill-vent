import 'dart:convert';

class MedicalHistory {
  String? command;
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
  List<MedicalCondition>? medicalConditions;
  bool? hasAllergies;
  String? allergiesDetails;
  FamilyHistory? familyHistory;
  bool? hasSurgeryHistory;
  List<SurgicalHistory>? surgicalHistories;
  String? birthControlMethod;
  bool? hasBloodTransfusionObjection;
  ImmunizationHistory? immunizationHistory;
  SocialHistory? socialHistory;

  MedicalHistory({
    this.command,
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
    this.medicalConditions,
    this.hasAllergies,
    this.allergiesDetails,
    this.familyHistory,
    this.hasSurgeryHistory,
    this.surgicalHistories,
    this.birthControlMethod,
    this.hasBloodTransfusionObjection,
    this.immunizationHistory,
    this.socialHistory,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) => MedicalHistory(
    command: json['command'],
    address: json['address'],
    bloodType: json['bloodType'],
    age: json['age'],
    weight: json['weight'],
    height: json['height'],
    gender: json['gender'],
    hasHighBloodPressure: json['hasHighBloodPressure'],
    hasLowBloodPressure: json['hasLowBloodPressure'],
    hasDiabetes: json['hasDiabetes'],
    diabetesType: json['diabetesType'],
    medicalConditions: List<MedicalCondition>.from(
        json['medicalConditions']?.map((x) => MedicalCondition.fromJson(x)) ?? []),
    hasAllergies: json['hasAllergies'],
    allergiesDetails: json['allergiesDetails'],
    familyHistory: FamilyHistory.fromJson(json['familyHistory'] ?? {}),
    hasSurgeryHistory: json['hasSurgeryHistory'],
    surgicalHistories: List<SurgicalHistory>.from(
        json['surgicalHistories']?.map((x) => SurgicalHistory.fromJson(x)) ?? []),
    birthControlMethod: json['birthControlMethod'],
    hasBloodTransfusionObjection: json['hasBloodTransfusionObjection'],
    immunizationHistory: ImmunizationHistory.fromJson(json['immunizationHistory'] ?? {}),
    socialHistory: SocialHistory.fromJson(json['socialHistory'] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    'command': command,
    'address': address,
    'bloodType': bloodType,
    'age': age,
    'weight': weight,
    'height': height,
    'gender': gender,
    'hasHighBloodPressure': hasHighBloodPressure,
    'hasLowBloodPressure': hasLowBloodPressure,
    'hasDiabetes': hasDiabetes,
    'diabetesType': diabetesType,
    'medicalConditions': medicalConditions?.map((x) => x.toJson()).toList(),
    'hasAllergies': hasAllergies,
    'allergiesDetails': allergiesDetails,
    'familyHistory': familyHistory?.toJson(),
    'hasSurgeryHistory': hasSurgeryHistory,
    'surgicalHistories': surgicalHistories?.map((x) => x.toJson()).toList(),
    'birthControlMethod': birthControlMethod,
    'hasBloodTransfusionObjection': hasBloodTransfusionObjection,
    'immunizationHistory': immunizationHistory?.toJson(),
    'socialHistory': socialHistory?.toJson(),
  };
}

class MedicalCondition {
  String? condition;
  String? details;

  MedicalCondition({this.condition, this.details});

  factory MedicalCondition.fromJson(Map<String, dynamic> json) => MedicalCondition(
    condition: json['condition'],
    details: json['details'],
  );

  Map<String, dynamic> toJson() => {
    'condition': condition,
    'details': details,
  };
}

class FamilyHistory {
  bool? hasCancerPolyps;
  String? cancerPolypsRelationship;
  bool? hasAnemia;
  String? anemiaRelationship;
  bool? hasDiabetes;
  String? diabetesRelationship;
  bool? hasBloodClots;
  String? bloodClotsRelationship;
  bool? hasHeartDisease;
  String? heartDiseaseRelationship;
  bool? hasStroke;
  String? strokeRelationship;
  bool? hasHighBloodPressure;
  String? highBloodPressureRelationship;
  bool? hasAnesthesiaReaction;
  String? anesthesiaReactionRelationship;
  bool? hasBleedingProblems;
  String? bleedingProblemsRelationship;
  bool? hasHepatitis;
  String? hepatitisRelationship;
  bool? hasOtherCondition;
  String? otherConditionDetails;
  String? otherConditionRelationship;

  FamilyHistory({
    this.hasCancerPolyps = false,
    this.cancerPolypsRelationship = '',
    this.hasAnemia = false,
    this.anemiaRelationship = '',
    this.hasDiabetes = false,
    this.diabetesRelationship = '',
    this.hasBloodClots = false,
    this.bloodClotsRelationship = '',
    this.hasHeartDisease = false,
    this.heartDiseaseRelationship = '',
    this.hasStroke = false,
    this.strokeRelationship = '',
    this.hasHighBloodPressure = false,
    this.highBloodPressureRelationship = '',
    this.hasAnesthesiaReaction = false,
    this.anesthesiaReactionRelationship = '',
    this.hasBleedingProblems = false,
    this.bleedingProblemsRelationship = '',
    this.hasHepatitis = false,
    this.hepatitisRelationship = '',
    this.hasOtherCondition = false,
    this.otherConditionDetails = '',
    this.otherConditionRelationship = '',
  });

  factory FamilyHistory.fromJson(Map<String, dynamic> json) => FamilyHistory(
    hasCancerPolyps: json['hasCancerPolyps'],
    cancerPolypsRelationship: json['cancerPolypsRelationship'],
    hasAnemia: json['hasAnemia'],
    anemiaRelationship: json['anemiaRelationship'],
    hasDiabetes: json['hasDiabetes'],
    diabetesRelationship: json['diabetesRelationship'],
    hasBloodClots: json['hasBloodClots'],
    bloodClotsRelationship: json['bloodClotsRelationship'],
    hasHeartDisease: json['hasHeartDisease'],
    heartDiseaseRelationship: json['heartDiseaseRelationship'],
    hasStroke: json['hasStroke'],
    strokeRelationship: json['strokeRelationship'],
    hasHighBloodPressure: json['hasHighBloodPressure'],
    highBloodPressureRelationship: json['highBloodPressureRelationship'],
    hasAnesthesiaReaction: json['hasAnesthesiaReaction'],
    anesthesiaReactionRelationship: json['anesthesiaReactionRelationship'],
    hasBleedingProblems: json['hasBleedingProblems'],
    bleedingProblemsRelationship: json['bleedingProblemsRelationship'],
    hasHepatitis: json['hasHepatitis'],
    hepatitisRelationship: json['hepatitisRelationship'],
    hasOtherCondition: json['hasOtherCondition'],
    otherConditionDetails: json['otherConditionDetails'],
    otherConditionRelationship: json['otherConditionRelationship'],
  );

  Map<String, dynamic> toJson() => {
    'hasCancerPolyps': hasCancerPolyps,
    'cancerPolypsRelationship': cancerPolypsRelationship,
    'hasAnemia': hasAnemia,
    'anemiaRelationship': anemiaRelationship,
    'hasDiabetes': hasDiabetes,
    'diabetesRelationship': diabetesRelationship,
    'hasBloodClots': hasBloodClots,
    'bloodClotsRelationship': bloodClotsRelationship,
    'hasHeartDisease': hasHeartDisease,
    'heartDiseaseRelationship': heartDiseaseRelationship,
    'hasStroke': hasStroke,
    'strokeRelationship': strokeRelationship,
    'hasHighBloodPressure': hasHighBloodPressure,
    'highBloodPressureRelationship': highBloodPressureRelationship,
    'hasAnesthesiaReaction': hasAnesthesiaReaction,
    'anesthesiaReactionRelationship': anesthesiaReactionRelationship,
    'hasBleedingProblems': hasBleedingProblems,
    'bleedingProblemsRelationship': bleedingProblemsRelationship,
    'hasHepatitis': hasHepatitis,
    'hepatitisRelationship': hepatitisRelationship,
    'hasOtherCondition': hasOtherCondition,
    'otherConditionDetails': otherConditionDetails,
    'otherConditionRelationship': otherConditionRelationship,
  };
}

class SurgicalHistory {
  String? surgeryType;
  DateTime? date;
  String? details;

  SurgicalHistory({this.surgeryType, this.date, this.details});

  factory SurgicalHistory.fromJson(Map<String, dynamic> json) => SurgicalHistory(
    surgeryType: json['surgeryType'],
    date: json['date'] != null ? DateTime.parse(json['date']) : null,
    details: json['details'],
  );

  Map<String, dynamic> toJson() => {
    'surgeryType': surgeryType,
    'date': date?.toIso8601String(),
    'details': details,
  };
}

class ImmunizationHistory {
  bool? hasFlu;
  DateTime? fluDate;
  bool? hasTetanus;
  DateTime? tetanusDate;
  bool? hasPneumonia;
  DateTime? pneumoniaDate;
  bool? hasHepA;
  DateTime? hepADate;
  bool? hasHepB;
  DateTime? hepBDate;

  ImmunizationHistory({
    this.hasFlu = false,
    this.fluDate,
    this.hasTetanus = false,
    this.tetanusDate,
    this.hasPneumonia = false,
    this.pneumoniaDate,
    this.hasHepA = false,
    this.hepADate,
    this.hasHepB = false,
    this.hepBDate,
  });

  factory ImmunizationHistory.fromJson(Map<String, dynamic> json) => ImmunizationHistory(
    hasFlu: json['hasFlu'],
    fluDate: json['fluDate'] != null ? DateTime.parse(json['fluDate']) : null,
    hasTetanus: json['hasTetanus'],
    tetanusDate: json['tetanusDate'] != null ? DateTime.parse(json['tetanusDate']) : null,
    hasPneumonia: json['hasPneumonia'],
    pneumoniaDate: json['pneumoniaDate'] != null ? DateTime.parse(json['pneumoniaDate']) : null,
    hasHepA: json['hasHepA'],
    hepADate: json['hepADate'] != null ? DateTime.parse(json['hepADate']) : null,
    hasHepB: json['hasHepB'],
    hepBDate: json['hepBDate'] != null ? DateTime.parse(json['hepBDate']) : null,
  );

  Map<String, dynamic> toJson() => {
    'hasFlu': hasFlu,
    'fluDate': fluDate?.toIso8601String(),
    'hasTetanus': hasTetanus,
    'tetanusDate': tetanusDate?.toIso8601String(),
    'hasPneumonia': hasPneumonia,
    'pneumoniaDate': pneumoniaDate?.toIso8601String(),
    'hasHepA': hasHepA,
    'hepADate': hepADate?.toIso8601String(),
    'hasHepB': hasHepB,
    'hepBDate': hepBDate?.toIso8601String(),
  };
}

class SocialHistory {
  String? exerciseType;
  String? exerciseFrequency;
  int? packsPerDay;
  int? yearsSmoked;
  int? yearStopped;

  SocialHistory({
    this.exerciseType,
    this.exerciseFrequency,
    this.packsPerDay,
    this.yearsSmoked,
    this.yearStopped,
  });

  factory SocialHistory.fromJson(Map<String, dynamic> json) => SocialHistory(
    exerciseType: json['exerciseType'],
    exerciseFrequency: json['exerciseFrequency'],
    packsPerDay: json['packsPerDay'],
    yearsSmoked: json['yearsSmoked'],
    yearStopped: json['yearStopped'],
  );

  Map<String, dynamic> toJson() => {
    'exerciseType': exerciseType,
    'exerciseFrequency': exerciseFrequency,
    'packsPerDay': packsPerDay,
    'yearsSmoked': yearsSmoked,
    'yearStopped': yearStopped,
  };
}