/// exerciseType : "Running"
/// exerciseFrequency : "3 times/week"
/// packsPerDay : 1
/// yearsSmoked : 5
/// yearStopped : 2020

class SocialHistory {
  SocialHistory({
      this.exerciseType, 
      this.exerciseFrequency, 
      this.packsPerDay, 
      this.yearsSmoked, 
      this.yearStopped,});

  SocialHistory.fromJson(dynamic json) {
    exerciseType = json['exerciseType'];
    exerciseFrequency = json['exerciseFrequency'];
    packsPerDay = json['packsPerDay'];
    yearsSmoked = json['yearsSmoked'];
    yearStopped = json['yearStopped'];
  }
  String? exerciseType;
  String? exerciseFrequency;
  int? packsPerDay;
  int? yearsSmoked;
  int? yearStopped;
SocialHistory copyWith({  String? exerciseType,
  String? exerciseFrequency,
  int? packsPerDay,
  int? yearsSmoked,
  int? yearStopped,
}) => SocialHistory(  exerciseType: exerciseType ?? this.exerciseType,
  exerciseFrequency: exerciseFrequency ?? this.exerciseFrequency,
  packsPerDay: packsPerDay ?? this.packsPerDay,
  yearsSmoked: yearsSmoked ?? this.yearsSmoked,
  yearStopped: yearStopped ?? this.yearStopped,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exerciseType'] = exerciseType;
    map['exerciseFrequency'] = exerciseFrequency;
    map['packsPerDay'] = packsPerDay;
    map['yearsSmoked'] = yearsSmoked;
    map['yearStopped'] = yearStopped;
    return map;
  }

}