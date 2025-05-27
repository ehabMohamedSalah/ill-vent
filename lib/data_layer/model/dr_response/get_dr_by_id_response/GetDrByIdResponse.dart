import 'AvailableDays.dart';

class GetDrByIdResponse {
  GetDrByIdResponse({
    this.id,
    this.name,
    this.specialty,
    this.imageUrl,
    this.rating,
    this.availableDays,
  });

  GetDrByIdResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    specialty = json['specialty'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    if (json['availableDays'] != null) {
      availableDays = [];
      json['availableDays'].forEach((v) {
        availableDays?.add(AvailableDays.fromJson(v));
      });
    }
  }

  num? id; // <-- changed from int? to num?
  String? name;
  String? specialty;
  String? imageUrl;
  num? rating; // <-- changed from int? to num?
  List<AvailableDays>? availableDays;

  GetDrByIdResponse copyWith({
    num? id,
    String? name,
    String? specialty,
    String? imageUrl,
    num? rating,
    List<AvailableDays>? availableDays,
  }) =>
      GetDrByIdResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        specialty: specialty ?? this.specialty,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating,
        availableDays: availableDays ?? this.availableDays,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['specialty'] = specialty;
    map['imageUrl'] = imageUrl;
    map['rating'] = rating;
    if (availableDays != null) {
      map['availableDays'] = availableDays?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
