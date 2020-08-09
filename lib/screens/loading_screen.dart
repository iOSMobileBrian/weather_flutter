import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    getLocation();
  }


  void getLocation() async{
    Location location = Location();
    await location.currentLocation();
    print(location.latitude);
    print(location.longitude);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
