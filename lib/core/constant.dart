class Constant {
  static const String nameKey = "user_name";
  static const String emailKey = "user_email";

  static const String tokenKey = "authToken";
  static const String isRememberMe = 'isRememberMe';
  static const String baseUrl = "https://illventapp.azurewebsites.net/api/";
  static const String regExValidateEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static RegExp regexPass = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
  );

  static const String questCacheKey = "is_quest";

  // ✅ المتغيرات اللي طلبتها
  static const String medicalHistory = "medicalHistory";
  static const String qrCodeData = "qrCodeData";
  static const String userFriendlyToken = "userFriendlyToken";
}
