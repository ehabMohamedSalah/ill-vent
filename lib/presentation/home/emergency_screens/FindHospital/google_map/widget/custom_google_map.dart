import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:ill_vent/presentation/home/emergency_screens/FindHospital/google_map/location_service/location_service.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  CameraPosition? initialCameraPostion;
  late LocationService locationService;

  GoogleMapController? googleMapController;

  Set<Marker> markers = {};

  @override
  void initState() {
    locationService = LocationService();
    super.initState();
    updateMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        googleMapController = controller;
        initMapStyle();

        // لو الـ initialCameraPostion مش محدد بعد، حددها على نقطة افتراضية
        if (initialCameraPostion == null) {
          initialCameraPosition: initialCameraPostion ??
              CameraPosition(target: LatLng(30.071726, 31.220578), zoom: 18);
          setState(() {}); // لتحديث الواجهة مع initial position
        }
      },
      initialCameraPosition:
      initialCameraPostion ?? const CameraPosition(target: LatLng(30.071726, 31.220578), zoom: 18),
    );
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_syles/night_map_style.json');

    googleMapController?.setMapStyle(nightMapStyle);
  }

  void updateMyLocation() async {
    bool serviceEnabled = await locationService.checkAndRequestLocationService();
    if (!serviceEnabled) return;

    bool permissionGranted = await locationService.checkAndRequestLocationPermission();
    if (!permissionGranted) return;

    locationService.getRealTimeLocationData((locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        final newCameraPosition = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15,
        );

        if (initialCameraPostion == null) {
          setState(() {
            initialCameraPostion = newCameraPosition;
            markers.clear();
            markers.add(
              Marker(
                markerId: const MarkerId('my_location_marker'),
                position: LatLng(locationData.latitude!, locationData.longitude!),
              ),
            );
          });
        } else {
          // لو عايز تحدث الماركر والكاميرا بعدين فقط:
          setMyLocationMarker(locationData);
          setMyCameraPosition(locationData);
        }
      }
    });
  }

  void setMyCameraPosition(LocationData locationData) {
    final cameraPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!), zoom: 15);

    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // حدد initialCameraPostion لأول مرة لتحديث الواجهة لو ماكانش محدد
    if (initialCameraPostion == null) {
      initialCameraPostion = cameraPosition;
      setState(() {});
    }
  }

  void setMyLocationMarker(LocationData locationData) {
    final myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.clear(); // امسح الماركرات القديمة عشان ما تتكررش
    markers.add(myLocationMarker);
    setState(() {});
  }
}
