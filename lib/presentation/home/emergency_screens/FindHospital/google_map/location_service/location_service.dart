
import 'package:location/location.dart';

class LocationService {
  Location location = Location();


  //bt3ml hagten check al location mfto7 w law la t3ml req enk tft7o
  //  enable location services
  Future<bool> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();//mf3l al location service wala
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();//law msh mtf3la req enk tf3lha
      if (!isServiceEnabled) {
        return false;   //law al feature de 3tlt blkamel tl3lo error bar msln
      }
    }

    return true;
  }


  //location permissions
  //ydene sal7ya enyy a3rf al location bta3oo
  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();//bshof ana 3nde permission akhdto abl kda wala
    if (permissionStatus == PermissionStatus.deniedForever) {//law howa msh mwaf2 enk takhod permmisions>
      return false;   //khalas msh h3ml req tanyy
    }
    if (permissionStatus == PermissionStatus.denied) {//law al permmision mrfod
      permissionStatus = await location.requestPermission(); //atlob enk takhod permmisions
      return permissionStatus == PermissionStatus.granted;//a3mlo return law howa granted
    }

    return true;
  }


  //get location
  void getRealTimeLocationData(void Function(LocationData)? onData) {
    location.changeSettings(
        distanceFilter: 2
    );
    location.onLocationChanged.listen(onData);
  }
//lazm at2kd al awl eny m3aya al permission
//btdek al location bta3k k stream 3shan toll manta  btt7rk b al mobile ydek al location al gded
}
