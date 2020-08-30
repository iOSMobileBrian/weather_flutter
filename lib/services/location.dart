import 'package:geolocator/geolocator.dart';


class Location{

  double latitude;
  double longitude;

  Future<void> currentLocation () async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);

      latitude = position.latitude;
      longitude = position.longitude;

      print('location$latitude&$longitude');
    }

    catch (e){
      print(e);
    }
  }
}