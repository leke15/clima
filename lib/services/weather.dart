import '../services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "13e84bb37ba54f9eb51192409252306";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=${location.getLatitude()},${location.getLongitude()}&aqi=yes"));
    var weatherData = await networkHelper.getdata();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition == 1087) {
      return '🌩';
    } else if (condition < 1171) {
      return '🌧';
    } else if (condition < 1195) {
      return '☔️';
    } else if (condition < 1225) {
      return '☃️';
    } else if (condition < 1030) {
      return '🌫';
    } else if (condition == 1000) {
      return '☀️';
    } else if (condition <= 1009) {
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
