class HospitalResponse {
  HospitalResponse({
    this.name,
    this.description,
    this.thumbnail,
    this.imageUrl,
    this.location,
    this.rating,
    this.contactNumber,
    this.established,
    this.specialties,
  });

  HospitalResponse.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    rating = json['rating']; // دلوقتي يقبل int أو double
    contactNumber = json['contactNumber'];
    established = json['established'];
    specialties = json['specialties'] != null ? json['specialties'].cast<String>() : [];
  }

  String? name;
  String? description;
  String? thumbnail;
  String? imageUrl;
  String? location;
  num? rating; // 🟢 هنا التغيير
  String? contactNumber;
  String? established;
  List<String>? specialties;

  HospitalResponse copyWith({
    String? name,
    String? description,
    String? thumbnail,
    String? imageUrl,
    String? location,
    num? rating, // 🟢 هنا كمان
    String? contactNumber,
    String? established,
    List<String>? specialties,
  }) =>
      HospitalResponse(
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        imageUrl: imageUrl ?? this.imageUrl,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        contactNumber: contactNumber ?? this.contactNumber,
        established: established ?? this.established,
        specialties: specialties ?? this.specialties,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['thumbnail'] = thumbnail;
    map['imageUrl'] = imageUrl;
    map['location'] = location;
    map['rating'] = rating;
    map['contactNumber'] = contactNumber;
    map['established'] = established;
    map['specialties'] = specialties;
    return map;
  }
}
