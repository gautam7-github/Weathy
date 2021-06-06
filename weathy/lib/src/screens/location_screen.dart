import 'package:flutter/material.dart';
import 'package:weathy/src/components/min_max.dart';
import 'package:weathy/src/components/sunTimes.dart';
import 'package:weathy/src/components/topBar.dart';
import 'package:weathy/src/components/feelsLike.dart';
import 'package:weathy/src/components/tempInfo.dart';
import 'package:weathy/src/components/windbar.dart';
import 'package:weathy/src/services/weather.dart';
import 'package:weathy/src/utilities/constants.dart';
import 'package:weathy/src/utilities/gradients.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
  LocationScreen({this.weatherData});
}

class _LocationScreenState extends State<LocationScreen> {
  var weatherService = WeatherModel();
  dynamic temperature;
  dynamic feelsLike;
  dynamic max;
  dynamic min;
  dynamic degree;
  String? weatherIcon;
  String? cityName;
  String? weatherSummary;
  String? weatherMessage;
  String? sunriseTime;
  String? sunsetTime;
  LinearGradient? grad;
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  Future<void> updateUI() async {
    var weatherData = widget.weatherData;
    print(weatherData);
    if (weatherData == null) {
      setState(
        () {
          temperature = 0;
          max = min = 0.0;
          feelsLike = 0;
          weatherIcon = '🤷'.toString();
          weatherMessage = 'Unable to get weather data';
          cityName = 'Hell(Maybe)';
          grad = kSunnyGrd;
          degree = 0;
          sunriseTime = sunsetTime = "";
        },
      );
    } else {
      setState(
        () {
          this.temperature = weatherData['main']['temp'];
          this.feelsLike = weatherData['main']['feels_like'];
          this.max = weatherData['main']['temp_max'];
          this.min = weatherData['main']['temp_min'];
          this.degree = weatherData['wind']['deg'];
          this.weatherIcon =
              weatherService.getWeatherIcon(weatherData['weather'][0]['id']);
          this.grad = weatherService.getColor(weatherData['weather'][0]['id']);
          this.weatherSummary = weatherData['weather'][0]['description'];
          this.weatherMessage = weatherService.getMessage(temperature);
          this.cityName = weatherData['name'];
          var sunrise = weatherData['sys']['sunrise'];
          sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000,
                      isUtc: true)
                  .toLocal()
                  .hour
                  .toString() +
              ":" +
              DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true)
                  .toLocal()
                  .minute
                  .toString();
          var sunset = weatherData['sys']['sunset'];
          sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000,
                      isUtc: true)
                  .toLocal()
                  .hour
                  .toString() +
              ":" +
              DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true)
                  .toLocal()
                  .minute
                  .toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: grad,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: RefreshIndicator(
            backgroundColor: Colors.black,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            strokeWidth: 3,
            color: Colors.white,
            onRefresh: () async {
              setState(() {
                updateUI();
              });
            },
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TopBar(
                      cityName: cityName,
                      onP: () {
                        setState(() {
                          updateUI();
                        });
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TempInfo(
                      weatherIcon: weatherIcon,
                      weatherSummary: weatherSummary,
                      temp: this.temperature.round(),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    FeelsLike(
                      feelsLike: this.feelsLike.round(),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    MinMaxData(
                      max: max,
                      min: min,
                    ),
                    WindBar(
                      degree: degree,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        '$weatherMessage',
                        style: kSummaryTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SunTimes(
                      sunRise: sunriseTime,
                      sunSet: sunsetTime,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
