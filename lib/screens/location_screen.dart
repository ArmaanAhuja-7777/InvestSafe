import 'package:clima_weather_app/screens/city_screen.dart';
import 'package:clima_weather_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima_weather_app/utils/constants.dart'; 
import 'package:clima_weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.weatherData});
  final weatherData; 
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

       late String mainWeatherDescription; 
         late int temperature ; 
       late int id; 
 late String cityName;
  WeatherModel weatherModel = WeatherModel(); 
  GetLocation getLocation = GetLocation(settings: kLocationSettings
 );
 
  void updateUI({dynamic dataGiven}){
   setState(() {
       var data = dataGiven ??  widget.weatherData; 
        if (data != null){
          mainWeatherDescription = data['weather'][0]['main']; 
        temperature = ((data['main']['temp'] as double).toInt()); 
        id= data['weather'][0]['id'];
          cityName = data['name']; 
        }else{
          temperature = 0; 
          id = 0; 
          cityName = ''; 
          return;
        }

   });
 }

@override
void initState(){
  super.initState(); 
  updateUI(); 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: const AssetImage('assets/images/city_background.jpg'), 
          fit: BoxFit.cover, 
          colorFilter: ColorFilter.mode(Colors.white.withOpacity((0.8)), BlendMode.dstATop))
        ),

        constraints:   BoxConstraints.expand(),
        child: SafeArea(child: 
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          ElevatedButton(onPressed: ()async{
            
            var data = await weatherModel.getData(await getLocation.getCurrentLocation()); 
            

           updateUI(dataGiven: data); 


          }, child: const Icon(Icons.near_me, size: 50,)), 
          ElevatedButton(onPressed: ()async{

           String typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen())); 

            if(typedName!=null){
            var data =  await weatherModel.getWeatherFromCityName(typedName); 

              updateUI(dataGiven: data); 
            }
          }, child: const Icon(Icons.location_city, size: 50,))
        ],), 
          Padding(padding: EdgeInsets.only(left: 15), child: Row(children: [Text(temperature.toString(), style: kTempTextStyle,), Text('${weatherModel.getWeatherIcon(id)}', style: kConditionTextStyle,)],),), 
          Padding(padding: EdgeInsets.only(right: 15), child: Text("${weatherModel.getMessage(temperature)}", textAlign: TextAlign.right,style: kMessageTextStyle,),)],)),
      ),
    );
  }
}