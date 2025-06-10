import '../../../emergency_response/Data.dart';

class CreateAppointmentResponse {
  CreateAppointmentResponse({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  CreateAppointmentResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  bool? success;
  String? message;
  Data? data;
  List<dynamic>? errors;

  CreateAppointmentResponse copyWith({
    bool? success,
    String? message,
    Data? data,
    List<dynamic>? errors,
  }) =>
      CreateAppointmentResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['errors'] = errors;
    return map;
  }
}
