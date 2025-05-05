/// date : "2025-05-05"
/// isAvailable : true
/// formattedDate : "Monday 5 May"

class AvailableDays {
  AvailableDays({
      this.date, 
      this.isAvailable, 
      this.formattedDate,});

  AvailableDays.fromJson(dynamic json) {
    date = json['date'];
    isAvailable = json['isAvailable'];
    formattedDate = json['formattedDate'];
  }
  String? date;
  bool? isAvailable;
  String? formattedDate;
AvailableDays copyWith({  String? date,
  bool? isAvailable,
  String? formattedDate,
}) => AvailableDays(  date: date ?? this.date,
  isAvailable: isAvailable ?? this.isAvailable,
  formattedDate: formattedDate ?? this.formattedDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['isAvailable'] = isAvailable;
    map['formattedDate'] = formattedDate;
    return map;
  }

}