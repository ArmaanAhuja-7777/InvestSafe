import 'package:clima_weather_app/services/networking.dart';

const API_kEY = "0a461520c1d795dfa826a84bcf972711";

class WeatherModel {
  dynamic getData(List<double> coord) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${coord[0]}&lon=${coord[1]}&appid=${API_kEY}&units=metric';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getHTTPresponse();

    return data;
  }

  Future<dynamic> getWeatherFromCityName(String cityName)async{

    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$API_kEY&units=metric';

       NetworkHelper networkHelper = NetworkHelper(url); 
       var data =await networkHelper.getHTTPresponse(); 

       return data; 


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
