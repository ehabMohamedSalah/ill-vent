import 'deal_entity.dart';

class DrEntity {
  final String? name;
  final int? price;
  final String? thumbnail;
  final String? imageUrl;
  final String? description;
  final String? availableDate;
  final double? rate;
  final String? phoneNumber;
  final String? location;
  final List<String>? availableDays;
  final Map<String, String>? workingHours;
  final DealEntity? deals;

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
}
