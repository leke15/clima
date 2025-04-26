import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    location.getLatitude();
    location.getLongitude();
  }

  void getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid={API key}"));

    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print("Massive Error on your side Buddy");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
