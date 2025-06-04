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
  static String getProductsEndpoint="Product";
  static String getProductsByIdEndpoint({required String productId}){
   return "Product/${productId}";
  }
  static String addToCart({required String productId,required String quantity}){
    return"Cart/add?productId=${productId}&quantity=${quantity}";
  }
  static String cartEndpoint="Cart";
  static String updateCartItem({required String id,required String quantity}){
    return "Cart/$id?quantity=$quantity";
  }
  static String deleteCartItem({required String cartItemId}){
    return "Cart/${cartItemId}";
  }
  static String chechkout="Order/checkout";
  static String getOrders="Order";
  static String deleteOrder({required String orderId}){
    return "Order/${orderId}/cancel";
  }
 static String medicalhistoryEndpoint="medicalhistory";
 static String qrMedicalhistoryEndpoint="medicalhistory/qr";
 static String getQRMedicalhistoryEndpoint="MedicalHistory/qr/existing";
 static String emergencyRequestEndpoint="Emergency/request";
 static String getEmergencyStatusEndpoint({required String requestID}){
   return "Emergency/status/${requestID}";
 }
  static String completeEmergencyRequestEndpoint="Emergency/complete";

}