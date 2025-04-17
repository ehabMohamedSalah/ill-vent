/// success : true
/// message : "Operation succeeded"
/// email : "eee@gmail.com"

class RegisterResponse {
  RegisterResponse({
      this.success, 
      this.message, 
      this.email,});

  RegisterResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    email = json['email'];
  }
  bool? success;
  String? message;
  String? email;
RegisterResponse copyWith({  bool? success,
  String? message,
  String? email,
}) => RegisterResponse(  success: success ?? this.success,
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