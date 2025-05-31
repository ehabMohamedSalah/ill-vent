class LoginResponse {
  LoginResponse({
    this.success,
    this.message,
    this.token,
    this.email,
    this.userName,  // ضفت هنا
  });

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    email = json['email'];
    userName = json['userName'];  // ضفت هنا
  }

  bool? success;
  String? message;
  String? token;
  String? email;
  String? userName;  // ضفت هنا

  LoginResponse copyWith({
    bool? success,
    String? message,
    String? token,
    String? email,
    String? userName,   // ضفت هنا
  }) => LoginResponse(
    success: success ?? this.success,
    message: message ?? this.message,
    token: token ?? this.token,
    email: email ?? this.email,
    userName: userName ?? this.userName,   // ضفت هنا
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    map['email'] = email;
    map['userName'] = userName;   // ضفت هنا
    return map;
  }
}
