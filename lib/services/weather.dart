import 'package:flutter/cupertino.dart';
import 'package:weather_application/services/location.dart';
import 'package:weather_application/services/networking.dart';
import 'package:weather_application/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$kURL?q=$cityName&appid=$kapiKey&units=metric';

    NetowrkingHelper netowrkingHelper = NetowrkingHelper(url);
    var weatherData = await netowrkingHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    String url =
        '$kURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kapiKey&units=metric';

    NetowrkingHelper netowrkingHelper = NetowrkingHelper(url);
    var weatherData = await netowrkingHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
