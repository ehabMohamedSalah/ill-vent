import 'TargetHospitals.dart';

/// requestId : 31
/// trackingId : "EMR_31"
/// targetHospitals : [{"hospitalId":8,"name":"New Kasr El Aini French Hospital","location":"Manial, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20223652117","specialties":["General Surgery","Pediatrics","Dermatology","Dentistry"]},{"hospitalId":10,"name":"Cleopatra Hospital","location":"Heliopolis, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20224181818","specialties":["Cosmetic Surgery","Ophthalmology","Dermatology","Dental Care"]},{"hospitalId":11,"name":"As-Salam International Hospital","location":"Corniche El Nile, Maadi, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20225241000","specialties":["Orthopedics","Maternity","Plastic Surgery","ENT"]},{"hospitalId":12,"name":"Al Salam International Hospital - Mohandessin","location":"Mohandessin, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20233031600","specialties":["Maternity","ENT","Dermatology","General Surgery"]},{"hospitalId":14,"name":"Nile Badrawi Hospital","location":"Maadi, Cairo","distanceKm":0,"isAvailable":true,"contactNumber":"+20225270070","specialties":["Internal Medicine","Pediatrics","Orthopedics","Gastroenterology"]}]
/// hospitalsNotified : 5
/// selectionMethod : "Automatic"

class Data {
  Data({
      this.requestId, 
      this.trackingId, 
      this.targetHospitals, 
      this.hospitalsNotified, 
      this.selectionMethod,});

  Data.fromJson(dynamic json) {
    requestId = json['requestId'];
    trackingId = json['trackingId'];
    if (json['targetHospitals'] != null) {
      targetHospitals = [];
      json['targetHospitals'].forEach((v) {
        targetHospitals?.add(TargetHospitals.fromJson(v));
      });
    }
    hospitalsNotified = json['hospitalsNotified'];
    selectionMethod = json['selectionMethod'];
  }
  int? requestId;
  String? trackingId;
  List<TargetHospitals>? targetHospitals;
  int? hospitalsNotified;
  String? selectionMethod;
Data copyWith({  int? requestId,
  String? trackingId,
  List<TargetHospitals>? targetHospitals,
  int? hospitalsNotified,
  String? selectionMethod,
}) => Data(  requestId: requestId ?? this.requestId,
  trackingId: trackingId ?? this.trackingId,
  targetHospitals: targetHospitals ?? this.targetHospitals,
  hospitalsNotified: hospitalsNotified ?? this.hospitalsNotified,
  selectionMethod: selectionMethod ?? this.selectionMethod,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestId'] = requestId;
    map['trackingId'] = trackingId;
    if (targetHospitals != null) {
      map['targetHospitals'] = targetHospitals?.map((v) => v.toJson()).toList();
    }
    map['hospitalsNotified'] = hospitalsNotified;
    map['selectionMethod'] = selectionMethod;
    return map;
  }

}