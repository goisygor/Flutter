import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  // atributos
  final String apiKey = '681126f28e7d6fa3a7cfe0da0671e599';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  //métodos
  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> getWeatherByLocation(
      double lat, double lon) async {
    final url = Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }

  
  }
}
