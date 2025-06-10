class PharmacyResponse {
  PharmacyResponse({
    this.pharmacyId,
    this.name,
    this.description,
    this.thumbnail,
    this.imageUrl,
    this.location,
    this.rating,
    this.contactNumber,
    this.acceptPrivateInsurance,
    this.hasContract,
    this.websiteUrl,
  });

  PharmacyResponse.fromJson(dynamic json) {
    pharmacyId = json['pharmacyId'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    rating = json['rating'];
    contactNumber = json['contactNumber'];
    acceptPrivateInsurance = json['acceptPrivateInsurance'];
    hasContract = json['hasContract'];
    websiteUrl = json['websiteUrl'];
  }

  num? pharmacyId;
  String? name;
  String? description;
  String? thumbnail;
  String? imageUrl;
  String? location;
  num? rating;
  String? contactNumber;
  bool? acceptPrivateInsurance;
  bool? hasContract;
  String? websiteUrl;

  PharmacyResponse copyWith({
    num? pharmacyId,
    String? name,
    String? description,
    String? thumbnail,
    String? imageUrl,
    String? location,
    num? rating,
    String? contactNumber,
    bool? acceptPrivateInsurance,
    bool? hasContract,
    String? websiteUrl,
  }) =>
      PharmacyResponse(
        pharmacyId: pharmacyId ?? this.pharmacyId,
        name: name ?? this.name,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        imageUrl: imageUrl ?? this.imageUrl,
        location: location ?? this.location,
        rating: rating ?? this.rating,
        contactNumber: contactNumber ?? this.contactNumber,
        acceptPrivateInsurance: acceptPrivateInsurance ?? this.acceptPrivateInsurance,
        hasContract: hasContract ?? this.hasContract,
        websiteUrl: websiteUrl ?? this.websiteUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pharmacyId'] = pharmacyId;
    map['name'] = name;
    map['description'] = description;
    map['thumbnail'] = thumbnail;
    map['imageUrl'] = imageUrl;
    map['location'] = location;
    map['rating'] = rating;
    map['contactNumber'] = contactNumber;
    map['acceptPrivateInsurance'] = acceptPrivateInsurance;
    map['hasContract'] = hasContract;
    map['websiteUrl'] = websiteUrl;
    return map;
  }
}
