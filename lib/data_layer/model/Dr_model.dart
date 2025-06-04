import '../../Domain/entity/dr_entity.dart';
import 'deal_model.dart';

class DrModel extends DrEntity {
  DrModel({
    String? name,
    int? price,
    String? thumbnail,
    String? imageUrl,
    String? description,
    String? availableDate,
    double? rate,
    String? phoneNumber,
    String? location,
    List<String>? availableDays,
    Map<String, String>? workingHours,
    DealModel? deals,
  }) : super(
    name: name,
    price: price,
    thumbnail: thumbnail,
    imageUrl: imageUrl,
    description: description,
    availableDate: availableDate,
    rate: rate,
    phoneNumber: phoneNumber,
    location: location,
    availableDays: availableDays,
    workingHours: workingHours,
    deals: deals,
  );

  factory DrModel.fromJson(Map<String, dynamic> json) {
    return DrModel(
      name: json['name'] as String?,
      price: json['price'] as int?,
      thumbnail: json['thumbnail'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      availableDate: json['availableDate'] as String?,
      rate: json['rate'] != null ? double.tryParse(json['rate'].toString()) : null,
      phoneNumber: json['phoneNumber'] as String?,
      location: json['location'] as String?,
      availableDays: (json['availableDays'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      workingHours: (json['workingHours'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value.toString())),
      deals: json['deals'] != null && json['deals'].isNotEmpty
          ? DealModel.fromJson(json['deals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'thumbnail': thumbnail,
      'imageUrl': imageUrl,
      'description': description,
      'availableDate': availableDate,
      'rate': rate,
      'phoneNumber': phoneNumber,
      'location': location,
      'availableDays': availableDays,
      'workingHours': workingHours,
      'deals': deals
    };
  }

  /// ✅ Converts DrModel to DrEntity
  DrEntity toDrEntity() {
    return DrEntity(
      name: name,
      price: price,
      thumbnail: thumbnail,
      imageUrl: imageUrl,
      description: description,
      availableDate: availableDate,
      rate: rate,
      phoneNumber: phoneNumber,
      location: location,
      availableDays: availableDays,
      workingHours: workingHours,
      deals: deals
      //deals: deals?.google_map((deal) => deal.toDealEntity()).toList(),

    );
  }
}
