import 'dart:io';

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
    try {
      var weatherData = await weatherService.getLocationWeather();
      var airData = await weatherService.getAirLevels();
      if (weatherData == null) {
        throw HttpException("Internet Problems");
      }
      Get.off(
        () => LocationScreen(
          weatherData: weatherData,
          airData: airData,
        ),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [
                0.4,
                1.0,
              ],
              colors: [
                Color(0xFF141E30),
                Color(0xFF243B55),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
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
              Spacer(
                flex: 2,
              ),
              Text(
                "ProdiGinix Soft\nMade in India.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Spartan MB",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
