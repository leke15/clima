import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings:
              LocationSettings(accuracy: LocationAccuracy.bestForNavigation));
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print("Failed to get location");
    }
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
