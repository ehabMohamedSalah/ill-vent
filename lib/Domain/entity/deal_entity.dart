class DealEntity {
  DealEntity({
    this.dealName,
    this.dealDescription,
    this.dealPrice,
    this.validUntil,
  });

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
}
