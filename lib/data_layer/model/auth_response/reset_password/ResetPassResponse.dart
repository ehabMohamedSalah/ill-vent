/// success : true
/// message : "Operation succeeded"
/// email : "ehabmohamed52t@gmail.com"

class ResetPassResponse {
  ResetPassResponse({
      this.success, 
      this.message, 
      this.email,});

  ResetPassResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    email = json['email'];
  }
  bool? success;
  String? message;
  String? email;
ResetPassResponse copyWith({  bool? success,
  String? message,
  String? email,
}) => ResetPassResponse(  success: success ?? this.success,
  message: message ?? this.message,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['email'] = email;
    return map;
  }

}