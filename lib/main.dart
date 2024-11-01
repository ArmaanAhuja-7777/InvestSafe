import 'package:clima_weather_app/screens/city_screen.dart';
import 'package:clima_weather_app/screens/loading_screen.dart';
import 'package:clima_weather_app/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen()
    ); 
  }
}