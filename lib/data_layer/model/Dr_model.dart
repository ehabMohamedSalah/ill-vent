import '../../Domain/entity/dr_entity.dart';
import 'deal_model.dart';

class DrModel {
  DrModel({
    this.name,
    this.price,
    this.thumbnail,
    this.imageUrl,
    this.description,
    this.availableDate,
    this.rate,
    this.phoneNumber,
    this.location,
    this.availableDays,
    this.workingHours,
    this.deals,
  });

  DrModel.fromJson(dynamic json) {
    name = json['name'];
    price = json['price'];
    thumbnail = json['thumbnail'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    availableDate = json['availableDate'];
    rate = json['rate'];
    phoneNumber = json['phoneNumber'];
    location = json['location'];
    availableDays = List<String>.from(json['availableDays'] ?? []);
    workingHours = Map<String, String>.from(json['workingHours'] ?? {});

    if (json['deals'] != null && json['deals'].isNotEmpty) {
      deals = List<DealModel>.from(json['deals'].map((x) => DealModel.fromJson(x)));
    }
  }

  String? name;
  int? price;
  String? thumbnail;
  String? imageUrl;
  String? description;
  String? availableDate;
  double? rate;
  String? phoneNumber;
  String? location;
  List<String>? availableDays;
  Map<String, String>? workingHours;
  List<DealModel>? deals;

  DrModel copyWith({
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
    List<DealModel>? deals,
  }) => DrModel(
    name: name ?? this.name,
    price: price ?? this.price,
    thumbnail: thumbnail ?? this.thumbnail,
    imageUrl: imageUrl ?? this.imageUrl,
    description: description ?? this.description,
    availableDate: availableDate ?? this.availableDate,
    rate: rate ?? this.rate,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    location: location ?? this.location,
    availableDays: availableDays ?? this.availableDays,
    workingHours: workingHours ?? this.workingHours,
    deals: deals ?? this.deals,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['price'] = price;
    map['thumbnail'] = thumbnail;
    map['imageUrl'] = imageUrl;
    map['description'] = description;
    map['availableDate'] = availableDate;
    map['rate'] = rate;
    map['phoneNumber'] = phoneNumber;
    map['location'] = location;
    map['availableDays'] = availableDays;
    map['workingHours'] = workingHours;
    if (deals != null) {
      map['deals'] = deals!.map((x) => x.toJson()).toList();
    }
    return map;
  }

  DrEntity toDrEntity() {
    return DrEntity(
      imageUrl: imageUrl,
      description: description,
      price: price,
      name: name,
      availableDate: availableDate,
      phoneNumber: phoneNumber,
      rate: rate,
      thumbnail: thumbnail,
      location: location,
      availableDays: availableDays,
      workingHours: workingHours,
      deals: deals?.map((deal) => deal.toDealEntity()).toList(),
    );
  }
}
