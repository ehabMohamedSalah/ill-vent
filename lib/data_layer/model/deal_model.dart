import '../../Domain/entity/deal_entity.dart';

class DealModel {
  DealModel({
    this.dealName,
    this.dealDescription,
    this.dealPrice,
    this.validUntil,
  });

  DealModel.fromJson(dynamic json) {
    dealName = json['dealName'];
    dealDescription = json['dealDescription'];
    dealPrice = json['dealPrice'];
    validUntil = json['validUntil'];
  }

  String? dealName;
  String? dealDescription;
  int? dealPrice;
  String? validUntil;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dealName'] = dealName;
    map['dealDescription'] = dealDescription;
    map['dealPrice'] = dealPrice;
    map['validUntil'] = validUntil;
    return map;
  }

  DealEntity toDealEntity() {
    return DealEntity(
      dealName: dealName,
      dealDescription: dealDescription,
      dealPrice: dealPrice,
      validUntil: validUntil,
    );
  }
}
