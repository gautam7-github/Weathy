import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService {
  double? latitude;
  double? longitude;
  Future<void> getUserLocation() async {
    try {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      //await location.changeSettings(accuracy: LocationAccuracy.high);
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          throw "PermissionException";
        }
      }
      await location.requestPermission();
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          throw "PermissionException";
        }
      }

      _locationData = await location.getLocation();
      latitude = _locationData.latitude;
      longitude = _locationData.longitude;
      print("$latitude $longitude");
    } catch (e) {
      Get.dialog(
        Container(
          child: Text("Location Problems"),
        ),
      );
      print("$latitude $longitude");
      print(e);
      latitude = 33.0;
      longitude = 74.0;
    }
  }
}
