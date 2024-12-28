import '../../Domain/entity/deal_entity.dart';

class DealModel extends DealEntity {
  DealModel({
    String? dealName,
    String? dealDescription,
    int? dealPrice,
    String? validUntil,
  }) : super(
    dealName: dealName,
    dealDescription: dealDescription,
    dealPrice: dealPrice,
    validUntil: validUntil,
  );

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      dealName: json['dealName'] as String?,
      dealDescription: json['dealDescription'] as String?,
      dealPrice: json['dealPrice'] != null ? int.tryParse(json['dealPrice'].toString()) : null,
      validUntil: json['validUntil'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dealName': dealName,
      'dealDescription': dealDescription,
      'dealPrice': dealPrice,
      'validUntil': validUntil,
    };
  }

  /// ✅ Converts DealModel to DealEntity
  DealEntity toDealEntity() {
    return DealEntity(
      dealName: dealName,
      dealDescription: dealDescription,
      dealPrice: dealPrice,
      validUntil: validUntil,
    );
  }
}
