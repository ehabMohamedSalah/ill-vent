import 'AcceptedHospital.dart';
import 'Location.dart';

/// requestId : 40
/// status : "Completed"
/// createdAt : "2025-06-03T19:30:37.3563477"
/// waitingTime : 501.5740610016667
/// hasHospitalResponse : true
/// hospitalResponseTime : "2025-06-03T19:32:05.5673753"
/// acceptedHospital : {"hospitalId":14,"name":"Nile Badrawi Hospital","location":"Maadi, Cairo","contactNumber":"+20225270070","latitude":29.9597,"longitude":31.2592,"distanceKm":11.68}
/// location : {"latitude":30.0644,"longitude":31.2497}

class Data {
  Data({
      this.requestId, 
      this.status, 
      this.createdAt, 
      this.waitingTime, 
      this.hasHospitalResponse, 
      this.hospitalResponseTime, 
      this.acceptedHospital, 
      this.location,});

  Data.fromJson(dynamic json) {
    requestId = json['requestId'];
    status = json['status'];
    createdAt = json['createdAt'];
    waitingTime = json['waitingTime'];
    hasHospitalResponse = json['hasHospitalResponse'];
    hospitalResponseTime = json['hospitalResponseTime'];
    acceptedHospital = json['acceptedHospital'] != null ? AcceptedHospital.fromJson(json['acceptedHospital']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  int? requestId;
  String? status;
  String? createdAt;
  double? waitingTime;
  bool? hasHospitalResponse;
  String? hospitalResponseTime;
  AcceptedHospital? acceptedHospital;
  Location? location;
Data copyWith({  int? requestId,
  String? status,
  String? createdAt,
  double? waitingTime,
  bool? hasHospitalResponse,
  String? hospitalResponseTime,
  AcceptedHospital? acceptedHospital,
  Location? location,
}) => Data(  requestId: requestId ?? this.requestId,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  waitingTime: waitingTime ?? this.waitingTime,
  hasHospitalResponse: hasHospitalResponse ?? this.hasHospitalResponse,
  hospitalResponseTime: hospitalResponseTime ?? this.hospitalResponseTime,
  acceptedHospital: acceptedHospital ?? this.acceptedHospital,
  location: location ?? this.location,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestId'] = requestId;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['waitingTime'] = waitingTime;
    map['hasHospitalResponse'] = hasHospitalResponse;
    map['hospitalResponseTime'] = hospitalResponseTime;
    if (acceptedHospital != null) {
      map['acceptedHospital'] = acceptedHospital?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}