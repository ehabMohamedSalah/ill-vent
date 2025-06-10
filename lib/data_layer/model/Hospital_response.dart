class HospitalResponse {
  HospitalResponse({
    this.hospitalId,
    this.name,
    this.description,
    this.thumbnail,
    this.imageUrl,
    this.location,
    this.rating,
    this.contactNumber,
    this.established,
    this.specialties,
    this.isAvailable,
    this.latitude,
    this.longitude,
    this.hasContract,
    this.websiteUrl,
  });

  HospitalResponse.fromJson(dynamic json) {
    hospitalId = json['hospitalId'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    rating = json['rating'];
    contactNumber = json['contactNumber'];
    established = json['established'];
    specialties = json['specialties'] != null ? json['specialties'].cast<String>() : [];
    isAvailable = json['isAvailable'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    hasContract = json['hasContract'];
    websiteUrl = json['websiteUrl'];
  }

  num? hospitalId;
  String? name;
  String? description;
  String? thumbnail;
  String? imageUrl;
  String? location;
  num? rating;
  String? contactNumber;
  String? established;
  List<String>? specialties;
  bool? isAvailable;
  num? latitude;
  num? longitude;
  bool? hasContract;
  String? websiteUrl;

  HospitalResponse copyWith({
    num? hospitalId,
    String? name,
    String? description,
    String? thumbnail,
    String? imageUrl,
    String? location,
    num? rating,
    String? contactNumber,
    String? established,
    List<String>? specialties,
    bool? isAvailable,
    num? latitude,
    num? longitude,
    bool? hasContract,
    String? websiteUrl,
  }) =>
      HospitalResponse(
        hospitalId: hospitalId ?? this.hospitalId,
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        imageUrl: imageUrl ?? this.imageUrl,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        contactNumber: contactNumber ?? this.contactNumber,
        established: established ?? this.established,
        specialties: specialties ?? this.specialties,
        isAvailable: isAvailable ?? this.isAvailable,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        hasContract: hasContract ?? this.hasContract,
        websiteUrl: websiteUrl ?? this.websiteUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hospitalId'] = hospitalId;
    map['name'] = name;
    map['description'] = description;
    map['thumbnail'] = thumbnail;
    map['imageUrl'] = imageUrl;
    map['location'] = location;
    map['rating'] = rating;
    map['contactNumber'] = contactNumber;
    map['established'] = established;
    map['specialties'] = specialties;
    map['isAvailable'] = isAvailable;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['hasContract'] = hasContract;
    map['websiteUrl'] = websiteUrl;
    return map;
  }
}
