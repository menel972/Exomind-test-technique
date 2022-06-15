import 'dart:convert';

import 'package:exomind_test/services/models/weather/weather_response.dart';

import '.api_secret_data.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  final _apiKey = ApiSecretData().apiKey;

  ///
  ///Urls
  ///
  final String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&lang=fr';
  String _key(String key) => '&appid=$key';
  final String _parisCoord = '&lat=48.85719&lon=2.35290';
  final String _bordeauxCoord = '&lat=44.83780&lon=0.58143';
  final String _londonCoord = '&lat=51.50335&lon=0.07940';
  final String _washingtonCoord = '&lat=38.89544&lon=77.03128';
  final String _marsaAlamCoord = '&lat=25.07573&lon=34.89181';

  ///
  /// Used to fetch Paris weather data
  ///
  Future<WeatherResponse> fetchParisWeather() async {
    String url = '$_baseUrl$_parisCoord${_key(_apiKey)}';
    final result = await request(url);

    return WeatherResponse.fromJson(result);
  }

  ///
  /// Used to fetch Bordeaux weather data
  ///
  Future<WeatherResponse> fetchBordeauxWeather() async {
    String url = '$_baseUrl$_bordeauxCoord${_key(_apiKey)}';
    final result = await request(url);

    return WeatherResponse.fromJson(result);
  }

  ///
  /// Used to fetch London weather data
  ///
  Future<WeatherResponse> fetchLondonWeather() async {
    String url = '$_baseUrl$_londonCoord${_key(_apiKey)}';
    final result = await request(url);

    return WeatherResponse.fromJson(result);
  }

  ///
  /// Used to fetch Washington weather data
  ///
  Future<WeatherResponse> fetchWashingtonWeather() async {
    String url = '$_baseUrl$_washingtonCoord${_key(_apiKey)}';
    final result = await request(url);

    return WeatherResponse.fromJson(result);
  }

  ///
  /// Used to fetch Marsa Alam weather data
  ///
  Future<WeatherResponse> fetchMarsaAlamWeather() async {
    String url = '$_baseUrl$_marsaAlamCoord${_key(_apiKey)}';
    final result = await request(url);

    return WeatherResponse.fromJson(result);
  }

  ///
  ///Used to fetch data from an API
  ///
  Future<Map<String, dynamic>> request(String url) async {
    final result = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = json.decode(result.body);

    return body;
  }
}
