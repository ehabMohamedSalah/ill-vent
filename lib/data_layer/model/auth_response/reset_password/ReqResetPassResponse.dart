/// success : true
/// message : "Operation succeeded"
/// email : "ym09602@gmail.com"

class ReqResetPassResponse {
  ReqResetPassResponse({
      this.success, 
      this.message, 
      this.email,});

  ReqResetPassResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    email = json['email'];
  }
  bool? success;
  String? message;
  String? email;
ReqResetPassResponse copyWith({  bool? success,
  String? message,
  String? email,
}) => ReqResetPassResponse(  success: success ?? this.success,
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