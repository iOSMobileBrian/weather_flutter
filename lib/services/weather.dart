import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


const apiKey = '14a7fcf90ad7159a1ea693de589f34ec';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherUrl?q=$cityName&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }



  Future<dynamic> getLocationWeather() async{

    Location location = Location();

    await location.currentLocation();

    NetworkHelper networkHelper = NetworkHelper(url:'$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial' );

    var weatherData =  await networkHelper.getData();

    print('data: $weatherData');

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
    if (temp > 80) {
      return 'It\'s 🍦 time';
    } else if (temp > 60) {
      return 'Time for shorts and 👕';
    } else if (temp < 32) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
