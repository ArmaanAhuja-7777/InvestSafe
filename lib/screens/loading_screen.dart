import 'package:clima_weather_app/screens/location_screen.dart';
import 'package:clima_weather_app/services/location.dart';
import 'package:clima_weather_app/services/networking.dart';
import 'package:clima_weather_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loading_indicator/loading_indicator.dart';

// ?? this is a null aware operator which gives if a variable is null or not j

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});

  // late double latitude,  longitude;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<double> coord = [];
  WeatherModel newWeatherModel = WeatherModel();
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getLocation() async {
    GetLocation location = GetLocation(settings: locationSettings);
    coord = await location.getCurrentLocation();

    if (coord != null && coord.isNotEmpty) {
      var data = await newWeatherModel.getData(coord);

      if (data != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LocationScreen(
                      weatherData: data,
                    )));
      }
    }

    print(coord);
  }

  @override
  Widget build(BuildContext context) {
    getLocation();

    return Scaffold(
      body: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,

            /// Required, The loading type of the widget
            colors: const [Colors.white],

            /// Optional, The color collections
            strokeWidth: 2,

            /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.black,

            /// Optional, Background of the widget
            pathBackgroundColor: Colors.black

            /// Optional, the stroke backgroundColor
            ),
      ),
    );
  }
}
