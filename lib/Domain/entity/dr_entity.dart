import 'deal_entity.dart';

class DrEntity {
  DrEntity({
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
  List<DealEntity>? deals;
}
