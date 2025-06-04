/// hospitalId : 8
/// name : "New Kasr El Aini French Hospital"
/// location : "Manial, Cairo"
/// distanceKm : 0
/// isAvailable : true
/// contactNumber : "+20223652117"
/// specialties : ["General Surgery","Pediatrics","Dermatology","Dentistry"]

class TargetHospitals {
  TargetHospitals({
      this.hospitalId, 
      this.name, 
      this.location, 
      this.distanceKm, 
      this.isAvailable, 
      this.contactNumber, 
      this.specialties,});

  TargetHospitals.fromJson(dynamic json) {
    hospitalId = json['hospitalId'];
    name = json['name'];
    location = json['location'];
    distanceKm = json['distanceKm'];
    isAvailable = json['isAvailable'];
    contactNumber = json['contactNumber'];
    specialties = json['specialties'] != null ? json['specialties'].cast<String>() : [];
  }
  int? hospitalId;
  String? name;
  String? location;
  int? distanceKm;
  bool? isAvailable;
  String? contactNumber;
  List<String>? specialties;
TargetHospitals copyWith({  int? hospitalId,
  String? name,
  String? location,
  int? distanceKm,
  bool? isAvailable,
  String? contactNumber,
  List<String>? specialties,
}) => TargetHospitals(  hospitalId: hospitalId ?? this.hospitalId,
  name: name ?? this.name,
  location: location ?? this.location,
  distanceKm: distanceKm ?? this.distanceKm,
  isAvailable: isAvailable ?? this.isAvailable,
  contactNumber: contactNumber ?? this.contactNumber,
  specialties: specialties ?? this.specialties,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hospitalId'] = hospitalId;
    map['name'] = name;
    map['location'] = location;
    map['distanceKm'] = distanceKm;
    map['isAvailable'] = isAvailable;
    map['contactNumber'] = contactNumber;
    map['specialties'] = specialties;
    return map;
  }

}