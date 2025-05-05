class PharmacyResponse {
  PharmacyResponse({
    this.name,
    this.description,
    this.thumbnail,
    this.imageUrl,
    this.location,
    this.rating,
    this.contactNumber,
    this.acceptPrivateInsurance,
    this.established, // ✅ أضفناها هنا
  });

  PharmacyResponse.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    rating = json['rating'];
    contactNumber = json['contactNumber'];
    acceptPrivateInsurance = json['acceptPrivateInsurance'];
    established = json['established']; // ✅ أضفناها هنا
  }

  String? name;
  String? description;
  String? thumbnail;
  String? imageUrl;
  String? location;
  num? rating;
  String? contactNumber;
  bool? acceptPrivateInsurance;
  String? established; // ✅ وهنا

  PharmacyResponse copyWith({
    String? name,
    String? description,
    String? thumbnail,
    String? imageUrl,
    String? location,
    num? rating,
    String? contactNumber,
    bool? acceptPrivateInsurance,
    String? established, // ✅ هنا كمان
  }) =>
      PharmacyResponse(
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        imageUrl: imageUrl ?? this.imageUrl,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        contactNumber: contactNumber ?? this.contactNumber,
        acceptPrivateInsurance: acceptPrivateInsurance ?? this.acceptPrivateInsurance,
        established: established ?? this.established,
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
    map['acceptPrivateInsurance'] = acceptPrivateInsurance;
    map['established'] = established; // ✅ وهنا
    return map;
  }
}
