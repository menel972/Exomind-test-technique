import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherResponse {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    coord = (json['coord'] != null ? Coord.fromJson(json['coord']) : null)!;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = (json['main'] != null ? Main.fromJson(json['main']) : null)!;
    visibility = json['visibility'];
    wind = (json['wind'] != null ? Wind.fromJson(json['wind']) : null)!;
    clouds = (json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null)!;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coord'] = coord!.toJson();
    data['weather'] = weather!.map((v) => v.toJson()).toList();
    data['base'] = base;
    data['main'] = main!.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind!.toJson();
    data['clouds'] = clouds!.toJson();
    data['dt'] = dt;
    data['sys'] = sys!.toJson();
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
