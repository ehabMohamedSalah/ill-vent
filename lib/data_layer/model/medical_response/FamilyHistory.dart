/// hasCancerPolyps : false
/// hasAnemia : true
/// anemiaRelationship : "Mother"
/// hasDiabetes : true
/// diabetesRelationship : "Father"
/// hasBloodClots : false
/// hasHeartDisease : true
/// heartDiseaseRelationship : "Grandfather"
/// hasStroke : false
/// hasHighBloodPressure : true
/// highBloodPressureRelationship : "Mother"
/// hasAnesthesiaReaction : false
/// hasBleedingProblems : false
/// hasHepatitis : false
/// hasOtherCondition : false

class FamilyHistory {
  FamilyHistory({
      this.hasCancerPolyps, 
      this.hasAnemia, 
      this.anemiaRelationship, 
      this.hasDiabetes, 
      this.diabetesRelationship, 
      this.hasBloodClots, 
      this.hasHeartDisease, 
      this.heartDiseaseRelationship, 
      this.hasStroke, 
      this.hasHighBloodPressure, 
      this.highBloodPressureRelationship, 
      this.hasAnesthesiaReaction, 
      this.hasBleedingProblems, 
      this.hasHepatitis, 
      this.hasOtherCondition,});

  FamilyHistory.fromJson(dynamic json) {
    hasCancerPolyps = json['hasCancerPolyps'];
    hasAnemia = json['hasAnemia'];
    anemiaRelationship = json['anemiaRelationship'];
    hasDiabetes = json['hasDiabetes'];
    diabetesRelationship = json['diabetesRelationship'];
    hasBloodClots = json['hasBloodClots'];
    hasHeartDisease = json['hasHeartDisease'];
    heartDiseaseRelationship = json['heartDiseaseRelationship'];
    hasStroke = json['hasStroke'];
    hasHighBloodPressure = json['hasHighBloodPressure'];
    highBloodPressureRelationship = json['highBloodPressureRelationship'];
    hasAnesthesiaReaction = json['hasAnesthesiaReaction'];
    hasBleedingProblems = json['hasBleedingProblems'];
    hasHepatitis = json['hasHepatitis'];
    hasOtherCondition = json['hasOtherCondition'];
  }
  bool? hasCancerPolyps;
  bool? hasAnemia;
  String? anemiaRelationship;
  bool? hasDiabetes;
  String? diabetesRelationship;
  bool? hasBloodClots;
  bool? hasHeartDisease;
  String? heartDiseaseRelationship;
  bool? hasStroke;
  bool? hasHighBloodPressure;
  String? highBloodPressureRelationship;
  bool? hasAnesthesiaReaction;
  bool? hasBleedingProblems;
  bool? hasHepatitis;
  bool? hasOtherCondition;
FamilyHistory copyWith({  bool? hasCancerPolyps,
  bool? hasAnemia,
  String? anemiaRelationship,
  bool? hasDiabetes,
  String? diabetesRelationship,
  bool? hasBloodClots,
  bool? hasHeartDisease,
  String? heartDiseaseRelationship,
  bool? hasStroke,
  bool? hasHighBloodPressure,
  String? highBloodPressureRelationship,
  bool? hasAnesthesiaReaction,
  bool? hasBleedingProblems,
  bool? hasHepatitis,
  bool? hasOtherCondition,
}) => FamilyHistory(  hasCancerPolyps: hasCancerPolyps ?? this.hasCancerPolyps,
  hasAnemia: hasAnemia ?? this.hasAnemia,
  anemiaRelationship: anemiaRelationship ?? this.anemiaRelationship,
  hasDiabetes: hasDiabetes ?? this.hasDiabetes,
  diabetesRelationship: diabetesRelationship ?? this.diabetesRelationship,
  hasBloodClots: hasBloodClots ?? this.hasBloodClots,
  hasHeartDisease: hasHeartDisease ?? this.hasHeartDisease,
  heartDiseaseRelationship: heartDiseaseRelationship ?? this.heartDiseaseRelationship,
  hasStroke: hasStroke ?? this.hasStroke,
  hasHighBloodPressure: hasHighBloodPressure ?? this.hasHighBloodPressure,
  highBloodPressureRelationship: highBloodPressureRelationship ?? this.highBloodPressureRelationship,
  hasAnesthesiaReaction: hasAnesthesiaReaction ?? this.hasAnesthesiaReaction,
  hasBleedingProblems: hasBleedingProblems ?? this.hasBleedingProblems,
  hasHepatitis: hasHepatitis ?? this.hasHepatitis,
  hasOtherCondition: hasOtherCondition ?? this.hasOtherCondition,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hasCancerPolyps'] = hasCancerPolyps;
    map['hasAnemia'] = hasAnemia;
    map['anemiaRelationship'] = anemiaRelationship;
    map['hasDiabetes'] = hasDiabetes;
    map['diabetesRelationship'] = diabetesRelationship;
    map['hasBloodClots'] = hasBloodClots;
    map['hasHeartDisease'] = hasHeartDisease;
    map['heartDiseaseRelationship'] = heartDiseaseRelationship;
    map['hasStroke'] = hasStroke;
    map['hasHighBloodPressure'] = hasHighBloodPressure;
    map['highBloodPressureRelationship'] = highBloodPressureRelationship;
    map['hasAnesthesiaReaction'] = hasAnesthesiaReaction;
    map['hasBleedingProblems'] = hasBleedingProblems;
    map['hasHepatitis'] = hasHepatitis;
    map['hasOtherCondition'] = hasOtherCondition;
    return map;
  }

}