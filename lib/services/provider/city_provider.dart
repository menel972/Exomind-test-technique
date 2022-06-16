import 'package:exomind_test/services/models/weather/weather_response.dart';
import 'package:flutter/cupertino.dart';

class CityProvider with ChangeNotifier {
  WeatherResponse? _paris;
  WeatherResponse? _bordeaux;
  WeatherResponse? _london;
  WeatherResponse? _washington;
  WeatherResponse? _marsaAlam;

  WeatherResponse? get par => _paris;
  WeatherResponse? get bor => _bordeaux;
  WeatherResponse? get lon => _london;
  WeatherResponse? get was => _washington;
  WeatherResponse? get mar => _marsaAlam;

  setParisData(WeatherResponse data) {
    _paris = data;
    notifyListeners();
  }

  setBordeauxData(WeatherResponse data) {
    _bordeaux = data;
    notifyListeners();
  }

  setLondonData(WeatherResponse data) {
    _london = data;
    notifyListeners();
  }

  setWashingtonData(WeatherResponse data) {
    _washington = data;
    notifyListeners();
  }

  setMarsaAlamData(WeatherResponse data) {
    _marsaAlam = data;
    notifyListeners();
  }
}
