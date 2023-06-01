import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/networking.dart';
import 'package:flutter_weather_app/utilities/constants.dart';
import 'loading_screen.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});

  final locationWeather; // bu bir property.. buna değer atayacağız ama diğer sayfadan.. ztn amaç bu. loading screende navigate ederken bu propertye bir değer atıyoruz.
// veriyi LocationScreen objecte aldık. Peki LocationScreen!!STATE!! objecte nasıl aktaracağız? bu ikisi aynı şey değil dikkat et.
  //burda da ortaya widget. (VİCIT NOKTA meselesi ortaya çıkıyor.)
  // text widgetlarımız LocationScreenState objectimizin build metodunda yaşıyolar.

  @override
  _LocationScreenState createState() => _LocationScreenState();
}



class _LocationScreenState extends State<LocationScreen> {

  double? temperature;
  String? city;
  String? weather;

  @override
  void initState(){
    super.initState();
    UpdateUI(widget.locationWeather);
  }

  void UpdateUI(dynamic weatherData) {
    temperature = weatherData['main']['temp'];
    city = weatherData['name'];
    weather = weatherData["weather"][0]["main"];

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '32',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




