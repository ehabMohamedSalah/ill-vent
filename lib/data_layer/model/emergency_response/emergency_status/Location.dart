/// latitude : 30.0644
/// longitude : 31.2497

class Location {
  Location({
      this.latitude, 
      this.longitude,});

  Location.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;
Location copyWith({  double? latitude,
  double? longitude,
}) => Location(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}