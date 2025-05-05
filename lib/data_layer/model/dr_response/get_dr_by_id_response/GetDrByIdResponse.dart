import 'AvailableDays.dart';

/// id : 31
/// name : "Dr. Ahmed Ayman"
/// specialty : "General Surgery"
/// imageUrl : "https://illventapp.azurewebsites.net/images/doctors/full/dr.-ahmed-ayman.png"
/// rating : 4
/// availableDays : [{"date":"2025-05-05","isAvailable":true,"formattedDate":"Monday 5 May"},{"date":"2025-05-06","isAvailable":true,"formattedDate":"Tuesday 6 May"},{"date":"2025-05-07","isAvailable":true,"formattedDate":"Wednesday 7 May"},{"date":"2025-05-08","isAvailable":true,"formattedDate":"Thursday 8 May"},{"date":"2025-05-09","isAvailable":true,"formattedDate":"Friday 9 May"},{"date":"2025-05-12","isAvailable":true,"formattedDate":"Monday 12 May"},{"date":"2025-05-13","isAvailable":true,"formattedDate":"Tuesday 13 May"},{"date":"2025-05-14","isAvailable":true,"formattedDate":"Wednesday 14 May"}]

class GetDrByIdResponse {
  GetDrByIdResponse({
      this.id, 
      this.name, 
      this.specialty, 
      this.imageUrl, 
      this.rating, 
      this.availableDays,});

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
  int? id;
  String? name;
  String? specialty;
  String? imageUrl;
  int? rating;
  List<AvailableDays>? availableDays;
GetDrByIdResponse copyWith({  int? id,
  String? name,
  String? specialty,
  String? imageUrl,
  int? rating,
  List<AvailableDays>? availableDays,
}) => GetDrByIdResponse(  id: id ?? this.id,
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