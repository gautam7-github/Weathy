import 'package:flutter/material.dart';
import 'package:weathy/src/services/location.dart';
import 'package:weathy/src/services/networking.dart';
import 'package:weathy/src/utilities/gradients.dart';

const API_KEY = "f84af5fcddbe72e88e80691320297b6b";
const baseURL = 'https://api.openweathermap.org/data/2.5/weather';
const polBaseURL = "http://api.openweathermap.org/data/2.5/air_pollution";

class WeatherModel {
  late LinearGradient backColor;
  String getWeatherIcon(dynamic condition) {
    if (condition < 300) {
      backColor = kRainyGrd;
      return '🌩';
    } else if (condition < 400) {
      backColor = kRainyGrd;
      return '🌧';
    } else if (condition < 600) {
      backColor = kRainyGrd;
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      backColor = kSunnyGrd;
      return '☀️';
    } else if (condition <= 804) {
      backColor = kCloudyGrd;
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(dynamic temp) {
    if (temp > 45) {
      return "BBQed by Nature";
    }
    if (temp > 35) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  LinearGradient getColor(int condition) {
    if (condition < 400) {
      return kHRainyGrd;
    } else if (condition < 600) {
      return kRainyGrd;
    } else if (condition < 700) {
      return kSnowyGrd;
    } else if (condition < 800) {
      return kCloudyGrd;
    } else if (condition == 800) {
      return kSunnyGrd;
    } else if (condition <= 804) {
      return kCloudyGrd;
    } else {
      return kSnowyGrd;
    }
  }

  late double lat;
  LocationService locationController = LocationService();
  Future<void> getCurrentLocation() async {
    await locationController.getUserLocation();
  }

  Future<dynamic> getLocationWeather() async {
    NetworkService networkController = NetworkService(
      url: baseURL +
          "?lat=${locationController.latitude}&lon=${locationController.longitude}&appid=$API_KEY&units=metric",
    );
    var data = await networkController.getData();
    return data;
  }

  Future<dynamic> getAirLevels() async {
    NetworkService netwrk = NetworkService(
      url:
          "$polBaseURL?lat=${locationController.latitude}&lon=${locationController.longitude}&appid=$API_KEY",
    );
    var data = await netwrk.getData();
    print(data);
    return data;
  }

  String? getAQILevel(int aqiLevel) {
    if (aqiLevel > 0 && aqiLevel <= 50) {
      return "Good";
    } else if (aqiLevel > 50 && aqiLevel <= 100) {
      return "Moderate";
    } else if (aqiLevel > 100 && aqiLevel <= 200) {
      return "Unhealthy";
    } else if (aqiLevel > 200 && aqiLevel <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }
  // http://api.openweathermap.org/data/2.5/air_pollution?lat={lat}&lon={lon}&appid={API key}
}

// api.openweathermap.org/data/2.5/weather