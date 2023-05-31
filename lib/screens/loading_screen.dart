import 'package:flutter/material.dart';
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator.getLocation();
  }

  Location locator = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print(locator.latitude);
            print(locator.latitude);
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}