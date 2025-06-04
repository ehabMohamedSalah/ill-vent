import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel(this.id, this.name, this.latLng);
}

List<PlaceModel> places = [
  PlaceModel(1, "شارع فيصل الرئيسي", LatLng(29.999127705868084, 31.16104904668849)),
  PlaceModel(2, "محطة مترو فيصل", LatLng(29.9941, 31.1726)),
  PlaceModel(3, "كومبوند دجلة جاردنز", LatLng(29.9873, 31.1647)),
  PlaceModel(4, "مول العرب (قريب من فيصل)", LatLng(30.0071, 31.0240)),
];
