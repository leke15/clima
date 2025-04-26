import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          locationSettings:
              LocationSettings(accuracy: LocationAccuracy.bestForNavigation));
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print("Failed to get location");
    }
  }

  void getLatitude() {
    print("Latitude: $_latitude");
  }

  void getLongitude() {
    print("Longitude: $_longitude");
  }
}
