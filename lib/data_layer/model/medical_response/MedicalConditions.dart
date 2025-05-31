/// condition : "Asthma"
/// details : "Mild and seasonal"

class MedicalConditions {
  MedicalConditions({
      this.condition, 
      this.details,});

  MedicalConditions.fromJson(dynamic json) {
    condition = json['condition'];
    details = json['details'];
  }
  String? condition;
  String? details;
MedicalConditions copyWith({  String? condition,
  String? details,
}) => MedicalConditions(  condition: condition ?? this.condition,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['condition'] = condition;
    map['details'] = details;
    return map;
  }

}