import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  //Method to get the current location of the user
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    latitude = position.latitude;
    longitude = position.longitude;
  }
}
