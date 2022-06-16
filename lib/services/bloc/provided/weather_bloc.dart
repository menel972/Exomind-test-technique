// ignore_for_file: avoid_print

import 'dart:async';

import 'package:exomind_test/services/api/weather_api.dart';
import 'package:exomind_test/services/models/weather/weather_response.dart';

import '../bloc.dart';

class WeatherBloc extends Bloc {
  ///
  ///Controllers
  ///
  final _parisController = StreamController<WeatherResponse>();
  final _bordeauxController = StreamController<WeatherResponse>();
  final _londonController = StreamController<WeatherResponse>();
  final _washingtonController = StreamController<WeatherResponse>();
  final _marsaAlamController = StreamController<WeatherResponse>();

  ///
  ///Sinks
  ///
  Sink<WeatherResponse> get _parisSink => _parisController.sink;
  Sink<WeatherResponse> get _bordeauxSink => _bordeauxController.sink;
  Sink<WeatherResponse> get _londonSink => _londonController.sink;
  Sink<WeatherResponse> get _washingtonSink => _washingtonController.sink;
  Sink<WeatherResponse> get _marsaAlamSink => _marsaAlamController.sink;

  ///
  ///Streams
  ///
  Stream<WeatherResponse> get parisStream => _parisController.stream;
  Stream<WeatherResponse> get bordeauxStream => _bordeauxController.stream;
  Stream<WeatherResponse> get londonStream => _londonController.stream;
  Stream<WeatherResponse> get washingtonStream => _washingtonController.stream;
  Stream<WeatherResponse> get marsaAlamStream => _marsaAlamController.stream;

  ///
  ///Get all datas
  ///
  Future<void> getAllDatas() async {
    await getParisWeather();
    await Future.delayed(const Duration(seconds: 10));
    await getBordeauxWeather();
  }

  ///
  /// Get Paris weather data
  ///
  Future<void> getParisWeather() async {
    final WeatherResponse paris = await WeatherApi().fetchParisWeather();

    _parisSink.add(paris);
    print('paris');
  }

  ///
  /// Get Bordeaux weather data
  ///
  Future<void> getBordeauxWeather() async {
    final WeatherResponse bordeaux = await WeatherApi().fetchBordeauxWeather();

    _bordeauxSink.add(bordeaux);
    print('bordeaux');
  }

  ///
  /// Get London weather data
  ///
  Future<void> getLondonWeather() async {
    final WeatherResponse london = await WeatherApi().fetchLondonWeather();

    _londonSink.add(london);
  }

  ///
  /// Get Washington weather data
  ///
  Future<void> getWashingtonWeather() async {
    final WeatherResponse washington =
        await WeatherApi().fetchWashingtonWeather();

    _washingtonSink.add(washington);
  }

  ///
  /// Get Marsa Alam weather data
  ///
  Future<void> getMarsaAlamWeather() async {
    final WeatherResponse marsaAlam =
        await WeatherApi().fetchMarsaAlamWeather();

    _marsaAlamSink.add(marsaAlam);
  }

  @override
  dispose() {
    _parisController.close();
    _bordeauxController.close();
    _londonController.close();
    _washingtonController.close();
    _marsaAlamController.close();
  }
}
