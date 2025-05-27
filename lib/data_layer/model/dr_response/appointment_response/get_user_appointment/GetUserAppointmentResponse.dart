/// id : 27
/// doctorId : 31
/// doctorName : "Dr. Ahmed Ayman"
/// doctorSpecialty : "General Surgery"
/// appointmentDate : "2025-05-26T00:00:00"
/// dayOfWeek : "Monday"
/// formattedTime : "09:00 AM - 09:30 AM"
/// patientName : "Borgar"
/// status : "Confirmed"
/// createdAt : "2025-05-26T07:05:49.3453338"

class GetUserAppointmentResponse {
  GetUserAppointmentResponse({
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

  GetUserAppointmentResponse.fromJson(dynamic json) {
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
GetUserAppointmentResponse copyWith({  int? id,
  int? doctorId,
  String? doctorName,
  String? doctorSpecialty,
  String? appointmentDate,
  String? dayOfWeek,
  String? formattedTime,
  String? patientName,
  String? status,
  String? createdAt,
}) => GetUserAppointmentResponse(  id: id ?? this.id,
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