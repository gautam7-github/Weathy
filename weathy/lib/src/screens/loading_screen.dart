import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weathy/src/screens/location_screen.dart';
import 'package:weathy/src/services/weather.dart';
import 'package:weathy/src/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  WeatherModel weatherService = WeatherModel();

  void getCurrentLocation() async {
    await weatherService.getCurrentLocation();
    var weatherData = await weatherService.getLocationWeather();
    Get.off(
      LocationScreen(weatherData: weatherData),
      transition: Transition.cupertino,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SpinKitChasingDots(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                "Loading",
                style: kSummaryTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
