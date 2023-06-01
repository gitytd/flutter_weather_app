import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';
import 'location.dart';
import '/services/networking.dart';


const apiKey = '5a2648d829cc83ac6c01be22010b1748';
double? lat;
double? long;

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

  void getLocationData() async {
    Location locator = Location();

    await locator.getLocation();

    lat = locator.latitude;
    long = locator.longitude;

    Networking network = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

    var weatherData = await network.getData();
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);  //locationWeather propertysi.. buna değer atadık yani burdaki verileri location stringe yolladık lol.
    }));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
