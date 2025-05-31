/// hasFlu : true
/// fluDate : "2024-10-01T00:00:00Z"
/// hasTetanus : true
/// tetanusDate : "2023-09-15T00:00:00Z"
/// hasPneumonia : false
/// hasHepA : true
/// hepADate : "2022-05-20T00:00:00Z"
/// hasHepB : true
/// hepBDate : "2022-06-10T00:00:00Z"

class ImmunizationHistory {
  ImmunizationHistory({
      this.hasFlu, 
      this.fluDate, 
      this.hasTetanus, 
      this.tetanusDate, 
      this.hasPneumonia, 
      this.hasHepA, 
      this.hepADate, 
      this.hasHepB, 
      this.hepBDate,});

  ImmunizationHistory.fromJson(dynamic json) {
    hasFlu = json['hasFlu'];
    fluDate = json['fluDate'];
    hasTetanus = json['hasTetanus'];
    tetanusDate = json['tetanusDate'];
    hasPneumonia = json['hasPneumonia'];
    hasHepA = json['hasHepA'];
    hepADate = json['hepADate'];
    hasHepB = json['hasHepB'];
    hepBDate = json['hepBDate'];
  }
  bool? hasFlu;
  String? fluDate;
  bool? hasTetanus;
  String? tetanusDate;
  bool? hasPneumonia;
  bool? hasHepA;
  String? hepADate;
  bool? hasHepB;
  String? hepBDate;
ImmunizationHistory copyWith({  bool? hasFlu,
  String? fluDate,
  bool? hasTetanus,
  String? tetanusDate,
  bool? hasPneumonia,
  bool? hasHepA,
  String? hepADate,
  bool? hasHepB,
  String? hepBDate,
}) => ImmunizationHistory(  hasFlu: hasFlu ?? this.hasFlu,
  fluDate: fluDate ?? this.fluDate,
  hasTetanus: hasTetanus ?? this.hasTetanus,
  tetanusDate: tetanusDate ?? this.tetanusDate,
  hasPneumonia: hasPneumonia ?? this.hasPneumonia,
  hasHepA: hasHepA ?? this.hasHepA,
  hepADate: hepADate ?? this.hepADate,
  hasHepB: hasHepB ?? this.hasHepB,
  hepBDate: hepBDate ?? this.hepBDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hasFlu'] = hasFlu;
    map['fluDate'] = fluDate;
    map['hasTetanus'] = hasTetanus;
    map['tetanusDate'] = tetanusDate;
    map['hasPneumonia'] = hasPneumonia;
    map['hasHepA'] = hasHepA;
    map['hepADate'] = hepADate;
    map['hasHepB'] = hasHepB;
    map['hepBDate'] = hepBDate;
    return map;
  }

}