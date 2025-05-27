import 'Appointment.dart';

/// success : true
/// message : "Your appointment with Dr. Dr. Omar Farouk on Tuesday, May 27, 2025 at 09:00 AM has been successfully cancelled."
/// appointment : {"id":29,"doctorId":35,"doctorName":"Dr. Omar Farouk","doctorSpecialty":"Neurology","appointmentDate":"2025-05-27T00:00:00","dayOfWeek":"Tuesday","formattedTime":"09:00 AM - 09:30 AM","patientName":"Borgar","status":"Cancelled","createdAt":"2025-05-27T07:47:33.4553164"}

class CancelAppointmentResponse {
  CancelAppointmentResponse({
      this.success, 
      this.message, 
      this.appointment,});

  CancelAppointmentResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    appointment = json['appointment'] != null ? Appointment.fromJson(json['appointment']) : null;
  }
  bool? success;
  String? message;
  Appointment? appointment;
CancelAppointmentResponse copyWith({  bool? success,
  String? message,
  Appointment? appointment,
}) => CancelAppointmentResponse(  success: success ?? this.success,
  message: message ?? this.message,
  appointment: appointment ?? this.appointment,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (appointment != null) {
      map['appointment'] = appointment?.toJson();
    }
    return map;
  }

}