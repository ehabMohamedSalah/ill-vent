/// startTime : "2025-05-05T11:00:00"
/// endTime : "2025-05-05T11:30:00"
/// isReserved : false
/// formattedStartTime : "11:00"
/// formattedEndTime : "11:30"

class AvailableTimeResponse {
  AvailableTimeResponse({
      this.startTime, 
      this.endTime, 
      this.isReserved, 
      this.formattedStartTime, 
      this.formattedEndTime,});

  AvailableTimeResponse.fromJson(dynamic json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    isReserved = json['isReserved'];
    formattedStartTime = json['formattedStartTime'];
    formattedEndTime = json['formattedEndTime'];
  }
  String? startTime;
  String? endTime;
  bool? isReserved;
  String? formattedStartTime;
  String? formattedEndTime;
AvailableTimeResponse copyWith({  String? startTime,
  String? endTime,
  bool? isReserved,
  String? formattedStartTime,
  String? formattedEndTime,
}) => AvailableTimeResponse(  startTime: startTime ?? this.startTime,
  endTime: endTime ?? this.endTime,
  isReserved: isReserved ?? this.isReserved,
  formattedStartTime: formattedStartTime ?? this.formattedStartTime,
  formattedEndTime: formattedEndTime ?? this.formattedEndTime,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['isReserved'] = isReserved;
    map['formattedStartTime'] = formattedStartTime;
    map['formattedEndTime'] = formattedEndTime;
    return map;
  }

}