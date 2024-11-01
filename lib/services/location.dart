import 'package:geolocator/geolocator.dart';
class GetLocation{

  late LocationSettings _locationSettings; 
  late double _latitude, _longitude; 
  GetLocation({required LocationSettings settings}){
   _locationSettings = settings; 
  }

  Future<List<double>> getCurrentLocation() async{ 
   try{
     Position position = await Geolocator.getCurrentPosition(locationSettings: _locationSettings);  
     _latitude =position.latitude; 
     _longitude = position.longitude; 

    // print("${position.latitude}, ${position.longitude}");
    return([position.latitude, position.longitude]) ;
   }
   catch(e){
    print(e);
    return([]); 
   }
  }
 
}