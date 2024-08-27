import 'package:untitled2/models/API.dart';

class Consts {
   String apiCurrent = API(
      baseUrl: "http://api.weatherstack.com",
      apiKey: "acess_key=3a07b967b86cf8ed0dd25ce5e3f371d4", 
      endPoint: "current",
   ).URL(queries: { 
      "query": "Cairo"
   });

    String getForecastUrl(String query) {
    return API(
      baseUrl: "http://api.weatherapi.com/v1",
      apiKey: "key=b157d36881f246f4922143432240708",
      endPoint: "forecast.json",
    ).URL(queries: {
      "q": query,
      "days": "7",
      "aqi": "no",
      "alerts": "no"
    });
  }
}



