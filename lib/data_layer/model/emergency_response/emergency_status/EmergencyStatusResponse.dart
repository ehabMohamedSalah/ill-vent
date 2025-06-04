import 'Data.dart';

/// success : true
/// data : {"requestId":40,"status":"Completed","createdAt":"2025-06-03T19:30:37.3563477","waitingTime":501.5740610016667,"hasHospitalResponse":true,"hospitalResponseTime":"2025-06-03T19:32:05.5673753","acceptedHospital":{"hospitalId":14,"name":"Nile Badrawi Hospital","location":"Maadi, Cairo","contactNumber":"+20225270070","latitude":29.9597,"longitude":31.2592,"distanceKm":11.68},"location":{"latitude":30.0644,"longitude":31.2497}}

class EmergencyStatusResponse {
  EmergencyStatusResponse({
      this.success, 
      this.data,});

  EmergencyStatusResponse.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;
EmergencyStatusResponse copyWith({  bool? success,
  Data? data,
}) => EmergencyStatusResponse(  success: success ?? this.success,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}