class Endpoints{
  static const String registerEndpoint = "auth/register";
  static const String loginEndpoint = "auth/login";
  static const String confirmEmailEndpoint="auth/confirm-email";
  static const String reqPasswordReset="auth/request-password-reset";
  static const String resetPassword="auth/reset-password";
  static const String getHospitals="Hospital";
  static const String getPharmacy="Pharmacy";
  static const String getDrEndpoint="Doctor";
  static String getDrById({required String id}) => "Doctor/$id";
  static String avaialbleTime({required String date,required String drID}) {
    return "Doctor/${drID}/schedule?date=$date";
  }
  static const String createAppoitmentEndpoint="Doctor/appointment";
  static const String getUserAppoitmentEndpoint="Doctor/appointments";
   static String cancelAppointmentEndpoint({required String drID}) {
    return "Doctor/appointment/${drID}/cancel";
  }
}