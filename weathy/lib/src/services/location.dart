import 'package:geolocator/geolocator.dart';

class LocationService {
  late double latitude = 38.8977;
  late double longitude = 77.0365;
  Future<void> getUserLocation() async {
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              forceAndroidLocationManager: true)
          .then(
        (Position position) {
          latitude = position.latitude;
          longitude = position.longitude;
        },
      );
    } catch (e) {
      latitude = 38.8977;
      longitude = 77.0365;
    }
  }
}
