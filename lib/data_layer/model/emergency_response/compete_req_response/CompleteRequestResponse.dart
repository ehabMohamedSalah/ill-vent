/// success : true
/// message : "Emergency request completed successfully"

class CompleteRequestResponse {
  CompleteRequestResponse({
      this.success, 
      this.message,});

  CompleteRequestResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
  }
  bool? success;
  String? message;
CompleteRequestResponse copyWith({  bool? success,
  String? message,
}) => CompleteRequestResponse(  success: success ?? this.success,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}