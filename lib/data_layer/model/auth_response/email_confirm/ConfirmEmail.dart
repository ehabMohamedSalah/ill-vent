/// success : true
/// message : "Operation succeeded"
/// email : "ehabmohamed52t@gmail.com"

class ConfirmEmailResponse {
  ConfirmEmailResponse({
      this.success, 
      this.message, 
      this.email,});

  ConfirmEmailResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    email = json['email'];
  }
  bool? success;
  String? message;
  String? email;
ConfirmEmailResponse copyWith({  bool? success,
  String? message,
  String? email,
}) => ConfirmEmailResponse(  success: success ?? this.success,
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