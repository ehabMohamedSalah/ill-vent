
import 'package:location/location.dart';

class LocationServicee {
  Location location = Location();

  Future<bool> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }

  Future<LocationData?> getCurrentLocation() async {
    bool serviceEnabled = await checkAndRequestLocationService();
    if (!serviceEnabled) return null;

    bool permissionGranted = await checkAndRequestLocationPermission();
    if (!permissionGranted) return null;

    return await location.getLocation();
  }
}
