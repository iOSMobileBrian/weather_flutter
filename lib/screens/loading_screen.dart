

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '14a7fcf90ad7159a1ea693de589f34ec';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  double longitude;
  double latitude;


  void getLocationData() async{
    Location location = Location();
    await location.currentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey' );

    var weatherData = await networkHelper.getData();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){

      return LocationScreen();

    }));



  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitCircle(
              color: Colors.grey,
              size: 50,

            ),
          ),
          Container(

            child: RaisedButton(
              onPressed: () {
                //Get the current location
                getLocationData();
              },
              child: Text('Get Location'),
            ),
          ),
        ],
      ),
    );
  }
}
