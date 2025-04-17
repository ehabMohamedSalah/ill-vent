/// success : true
/// message : "Operation succeeded"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU1ItWko0Qi0wMjgyIiwiZW1haWwiOiJlaGFibW9oYW1lZDUydEBnbWFpbC5jb20iLCJqdGkiOiJkMDM3OGFlNi0zYzE1LTRlMDYtYjI3NC0xZTI1ZGRlZDlhYjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IlVTUi1aSjRCLTAyODIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJlaGFiIG1vaGFtZWQiLCJlbWFpbF92ZXJpZmllZCI6IlRydWUiLCJleHAiOjE3NDQ4OTAzODcsImlzcyI6IklsbFZlbnQiLCJhdWQiOiJJbGxWZW50VXNlcnMifQ.m5WMFFpno1xBB6hezhsqQPKQFzmMvNNTP-VBB619O2I"
/// email : "ehabmohamed52t@gmail.com"

class LoginResponse {
  LoginResponse({
      this.success, 
      this.message, 
      this.token, 
      this.email,});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    email = json['email'];
  }
  bool? success;
  String? message;
  String? token;
  String? email;
LoginResponse copyWith({  bool? success,
  String? message,
  String? token,
  String? email,
}) => LoginResponse(  success: success ?? this.success,
  message: message ?? this.message,
  token: token ?? this.token,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    map['email'] = email;
    return map;
  }

}