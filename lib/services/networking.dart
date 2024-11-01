
import 'package:http/http.dart' as http; 
 
import 'dart:convert';

class NetworkHelper{
    String _url; 
    NetworkHelper(this._url); 

 

   dynamic getHTTPresponse()async{

      Uri urlAsURI = Uri.parse(_url);
    print(urlAsURI); 
     
     http.Response response = await http.get(urlAsURI); 

     if(response.statusCode ==200){
      String data = response.body; 
      var decodedData = jsonDecode(data); 
      return decodedData; 
     }

  return null; 

  }

}