import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/screens/location_screen.dart';
import 'package:weather_application/services/networking.dart';
import 'package:weather_application/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // get location method to get the user current location.

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // get location method of the user
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitWave(
        color: Colors.green,
        duration: const Duration(milliseconds: 2000),
        type: SpinKitWaveType.center,
        itemCount: 4,
        size: 90.0,
      ),
    );
  }
}
