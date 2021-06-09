import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as glt;

class LocationService {
  double? latitude;
  double? longitude;
  Future<void> getUserLocation() async {
    try {
      await glt.Geolocator.requestPermission().then(
        (value) async {
          var location = Location();
          await location.getLocation().then(
            (value) {
              latitude = value.latitude;
              longitude = value.longitude;
            },
          );
        },
      );
      print("$latitude $longitude");
    } catch (e) {
      print("$latitude $longitude");
      print(e);
      latitude = 0.0;
      longitude = 0.0;
    }
  }
}
