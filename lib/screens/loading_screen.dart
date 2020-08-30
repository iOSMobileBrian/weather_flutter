

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';





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




  void getLocationData() async{


    var weatherData = await WeatherModel().getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){

      return LocationScreen(locationWeather: weatherData,);

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
