import 'package:geolocator/geolocator.dart';

class Location {
  Location();

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;

      print('Latitude: $latitude, Longitude: $longitude');
    } catch (e) {
      print(e);
    }
  }
}
