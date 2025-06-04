

class EmergencyDataclass{

  String injuryPhotoBase64;
  String injuryDescription;
  double userLatitude;
  double userLongitude;
  String medicalHistoryQrCode;
  String medicalHistoryToken ;
  int priority;
  EmergencyDataclass({required this.injuryDescription,required this.injuryPhotoBase64,required this.medicalHistoryQrCode,required this.medicalHistoryToken,required this.priority,required this.userLatitude,required this.userLongitude});
}