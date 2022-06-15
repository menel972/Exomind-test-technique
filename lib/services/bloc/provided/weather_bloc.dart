import 'dart:async';

import 'package:exomind_test/services/api/weather_api.dart';
import 'package:exomind_test/services/models/weather/weather_response.dart';

import '../bloc.dart';

class WeatherBloc extends Bloc {
  List<WeatherResponse> list = [];

  final _controller = StreamController<List<WeatherResponse>>();
  Sink<List<WeatherResponse>> get _sink => _controller.sink;
  Stream<List<WeatherResponse>> get stream => _controller.stream;

  getParisWeather() async {
    final WeatherResponse paris = await WeatherApi().fetchParisWeather();

    list.add(paris);

    _sink.add(list);
  }

  @override
  dispose() => _controller.close();
}
