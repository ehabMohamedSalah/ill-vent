/// surgeryType : "Appendectomy"
/// date : "2015-08-10T00:00:00Z"
/// details : "Successful, no complications"

class SurgicalHistories {
  SurgicalHistories({
      this.surgeryType, 
      this.date, 
      this.details,});

  SurgicalHistories.fromJson(dynamic json) {
    surgeryType = json['surgeryType'];
    date = json['date'];
    details = json['details'];
  }
  String? surgeryType;
  String? date;
  String? details;
SurgicalHistories copyWith({  String? surgeryType,
  String? date,
  String? details,
}) => SurgicalHistories(  surgeryType: surgeryType ?? this.surgeryType,
  date: date ?? this.date,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['surgeryType'] = surgeryType;
    map['date'] = date;
    map['details'] = details;
    return map;
  }

}