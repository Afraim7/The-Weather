import 'package:dio/dio.dart';
import 'package:untitled2/consts.dart';
import 'package:untitled2/models/weather_model.dart';

class WeatherServices {
  Dio dio = Dio();

  Future<weatherData> getCurrentWeather({required String path, required Map<String, dynamic> query}) async {
    try {
      Response response =await dio.get(path,queryParameters: query);
      Map<String,dynamic> jsondata = response.data;
      List<dynamic> data = jsondata["articles"];
      late weatherData actual_data =weatherData.fromjson(data) ;
      return actual_data;
    } 
    
    catch (e) {
      print('Error fetching weather data: $e');
      throw Exception('Failed to fetch weather data');
    }
  }



  Future<weatherData> getForecastWeather(String city) async {
    String forecastUrl = Consts().getForecastUrl(city);
    try {
      Response response = await dio.get(forecastUrl);
      Map<String, dynamic> jsonData = response.data;
      return weatherData.fromjson(jsonData);
    } 
    
    catch (e) {
      print('Error fetching forecast data: $e');
      throw Exception('Failed to fetch forecast data');
    }
  }
}
