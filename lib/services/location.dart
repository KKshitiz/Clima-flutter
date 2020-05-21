import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> findLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
