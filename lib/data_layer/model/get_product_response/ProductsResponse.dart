class ProductsResponse {
  int? productId;
  String? name;
  String? description;
  int? price; // كانت double وبقت int
  String? imageUrl;
  String? thumbnail;
  int? rating;
  String? productType;
  bool? hasNFC;
  bool? hasMedicalDataStorage;
  bool? hasRescueProtocol;
  bool? hasVitalSensors;
  String? technicalDetails;
  int? stockQuantity;

  ProductsResponse({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.thumbnail,
    this.rating,
    this.productType,
    this.hasNFC,
    this.hasMedicalDataStorage,
    this.hasRescueProtocol,
    this.hasVitalSensors,
    this.technicalDetails,
    this.stockQuantity,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      productId: json['productId'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toInt(), // تحويل آمن من double لـ int
      imageUrl: json['imageUrl'],
      thumbnail: json['thumbnail'],
      rating: json['rating'],
      productType: json['productType'],
      hasNFC: json['hasNFC'],
      hasMedicalDataStorage: json['hasMedicalDataStorage'],
      hasRescueProtocol: json['hasRescueProtocol'],
      hasVitalSensors: json['hasVitalSensors'],
      technicalDetails: json['technicalDetails'],
      stockQuantity: json['stockQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['imageUrl'] = imageUrl;
    map['thumbnail'] = thumbnail;
    map['rating'] = rating;
    map['productType'] = productType;
    map['hasNFC'] = hasNFC;
    map['hasMedicalDataStorage'] = hasMedicalDataStorage;
    map['hasRescueProtocol'] = hasRescueProtocol;
    map['hasVitalSensors'] = hasVitalSensors;
    map['technicalDetails'] = technicalDetails;
    map['stockQuantity'] = stockQuantity;
    return map;
  }

  ProductsResponse copyWith({
    int? productId,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    String? thumbnail,
    int? rating,
    String? productType,
    bool? hasNFC,
    bool? hasMedicalDataStorage,
    bool? hasRescueProtocol,
    bool? hasVitalSensors,
    String? technicalDetails,
    int? stockQuantity,
  }) =>
      ProductsResponse(
        productId: productId ?? this.productId,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        thumbnail: thumbnail ?? this.thumbnail,
        rating: rating ?? this.rating,
        productType: productType ?? this.productType,
        hasNFC: hasNFC ?? this.hasNFC,
        hasMedicalDataStorage:
        hasMedicalDataStorage ?? this.hasMedicalDataStorage,
        hasRescueProtocol: hasRescueProtocol ?? this.hasRescueProtocol,
        hasVitalSensors: hasVitalSensors ?? this.hasVitalSensors,
        technicalDetails: technicalDetails ?? this.technicalDetails,
        stockQuantity: stockQuantity ?? this.stockQuantity,
      );
}
