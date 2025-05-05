class GetDrResponse {
  GetDrResponse({
    this.id,
    this.name,
    this.specialty,
    this.education,
    this.location,
    this.rating,
    this.acceptInsurance,
    this.imageUrl,
    this.thumbnail,
    this.hospital,
  });

  GetDrResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    specialty = json['specialty'];
    education = json['education'];
    location = json['location'];
    rating = json['rating'];
    acceptInsurance = json['acceptInsurance'];
    imageUrl = json['imageUrl'];
    thumbnail = json['thumbnail'];
    hospital = json['hospital'];
  }

  num? id;
  String? name;
  String? specialty;
  String? education;
  String? location;
  num? rating;
  bool? acceptInsurance;
  String? imageUrl;
  String? thumbnail;
  String? hospital;

  GetDrResponse copyWith({
    num? id,
    String? name,
    String? specialty,
    String? education,
    String? location,
    num? rating,
    bool? acceptInsurance,
    String? imageUrl,
    String? thumbnail,
    String? hospital,
  }) =>
      GetDrResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        specialty: specialty ?? this.specialty,
        education: education ?? this.education,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        acceptInsurance: acceptInsurance ?? this.acceptInsurance,
        imageUrl: imageUrl ?? this.imageUrl,
        thumbnail: thumbnail ?? this.thumbnail,
        hospital: hospital ?? this.hospital,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['specialty'] = specialty;
    map['education'] = education;
    map['location'] = location;
    map['rating'] = rating;
    map['acceptInsurance'] = acceptInsurance;
    map['imageUrl'] = imageUrl;
    map['thumbnail'] = thumbnail;
    map['hospital'] = hospital;
    return map;
  }
}
