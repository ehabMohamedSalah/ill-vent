import 'Data.dart';

/// success : true
/// message : "Emergency request sent to 5 hospital(s) automatically."
/// data : {"requestId":31,"trackingId":"EMR_31","targetHospitals":[{"hospitalId":8,"name":"New Kasr El Aini French Hospital","location":"Manial, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20223652117","specialties":["General Surgery","Pediatrics","Dermatology","Dentistry"]},{"hospitalId":10,"name":"Cleopatra Hospital","location":"Heliopolis, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20224181818","specialties":["Cosmetic Surgery","Ophthalmology","Dermatology","Dental Care"]},{"hospitalId":11,"name":"As-Salam International Hospital","location":"Corniche El Nile, Maadi, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20225241000","specialties":["Orthopedics","Maternity","Plastic Surgery","ENT"]},{"hospitalId":12,"name":"Al Salam International Hospital - Mohandessin","location":"Mohandessin, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20233031600","specialties":["Maternity","ENT","Dermatology","General Surgery"]},{"hospitalId":14,"name":"Nile Badrawi Hospital","location":"Maadi, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20225270070","specialties":["Internal Medicine","Pediatrics","Orthopedics","Gastroenterology"]}],"hospitalsNotified":5,"selectionMethod":"Automatic"}

class EmergencyRequestResponse {
  EmergencyRequestResponse({
      this.success, 
      this.message, 
      this.data,});

  EmergencyRequestResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;
EmergencyRequestResponse copyWith({  bool? success,
  String? message,
  Data? data,
}) => EmergencyRequestResponse(  success: success ?? this.success,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}