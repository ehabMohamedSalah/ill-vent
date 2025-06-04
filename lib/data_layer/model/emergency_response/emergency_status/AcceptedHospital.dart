/// hospitalId : 14
/// name : "Nile Badrawi Hospital"
/// location : "Maadi, Cairo"
/// contactNumber : "+20225270070"
/// latitude : 29.9597
/// longitude : 31.2592
/// distanceKm : 11.68

class AcceptedHospital {
  AcceptedHospital({
      this.hospitalId, 
      this.name, 
      this.location, 
      this.contactNumber, 
      this.latitude, 
      this.longitude, 
      this.distanceKm,});

  AcceptedHospital.fromJson(dynamic json) {
    hospitalId = json['hospitalId'];
    name = json['name'];
    location = json['location'];
    contactNumber = json['contactNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distanceKm = json['distanceKm'];
  }
  int? hospitalId;
  String? name;
  String? location;
  String? contactNumber;
  double? latitude;
  double? longitude;
  double? distanceKm;
AcceptedHospital copyWith({  int? hospitalId,
  String? name,
  String? location,
  String? contactNumber,
  double? latitude,
  double? longitude,
  double? distanceKm,
}) => AcceptedHospital(  hospitalId: hospitalId ?? this.hospitalId,
  name: name ?? this.name,
  location: location ?? this.location,
  contactNumber: contactNumber ?? this.contactNumber,
  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  distanceKm: distanceKm ?? this.distanceKm,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hospitalId'] = hospitalId;
    map['name'] = name;
    map['location'] = location;
    map['contactNumber'] = contactNumber;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['distanceKm'] = distanceKm;
    return map;
  }

}