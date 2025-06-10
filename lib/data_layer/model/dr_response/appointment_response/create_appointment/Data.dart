/// id : 78
/// doctorId : 32
/// doctorName : "Dr. Manal Mansour"
/// doctorSpecialty : "Ophthalmologist"
/// appointmentDate : "2025-06-11T00:00:00"
/// dayOfWeek : "Wednesday"
/// formattedTime : "16:00 - 16:30"
/// patientName : "Borgar"
/// status : "Confirmed"
/// createdAt : "2025-06-10T04:58:29.5202592Z"

class Data {
  Data({
      this.id, 
      this.doctorId, 
      this.doctorName, 
      this.doctorSpecialty, 
      this.appointmentDate, 
      this.dayOfWeek, 
      this.formattedTime, 
      this.patientName, 
      this.status, 
      this.createdAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorSpecialty = json['doctorSpecialty'];
    appointmentDate = json['appointmentDate'];
    dayOfWeek = json['dayOfWeek'];
    formattedTime = json['formattedTime'];
    patientName = json['patientName'];
    status = json['status'];
    createdAt = json['createdAt'];
  }
  int? id;
  int? doctorId;
  String? doctorName;
  String? doctorSpecialty;
  String? appointmentDate;
  String? dayOfWeek;
  String? formattedTime;
  String? patientName;
  String? status;
  String? createdAt;
Data copyWith({  int? id,
  int? doctorId,
  String? doctorName,
  String? doctorSpecialty,
  String? appointmentDate,
  String? dayOfWeek,
  String? formattedTime,
  String? patientName,
  String? status,
  String? createdAt,
}) => Data(  id: id ?? this.id,
  doctorId: doctorId ?? this.doctorId,
  doctorName: doctorName ?? this.doctorName,
  doctorSpecialty: doctorSpecialty ?? this.doctorSpecialty,
  appointmentDate: appointmentDate ?? this.appointmentDate,
  dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  formattedTime: formattedTime ?? this.formattedTime,
  patientName: patientName ?? this.patientName,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctorId'] = doctorId;
    map['doctorName'] = doctorName;
    map['doctorSpecialty'] = doctorSpecialty;
    map['appointmentDate'] = appointmentDate;
    map['dayOfWeek'] = dayOfWeek;
    map['formattedTime'] = formattedTime;
    map['patientName'] = patientName;
    map['status'] = status;
    map['createdAt'] = createdAt;
    return map;
  }

}