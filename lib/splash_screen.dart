import 'dart:async';
import 'package:flutter/material.dart';
import 'weather.dart';
import 'weatherservice.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    // route();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, getLocationData);
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  

  initScreen(BuildContext context) {
    return MaterialApp(
        title: "EyeMobile",
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset("assets/icons/eyemobileLogo.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                // CircularProgressIndicator()
              ],
            ),
          ),
        ));
  }
}
