class Sys {
  num? type;
  num? id;
  num? message;
  String? country;
  num? sunrise;
  num? sunset;

  Sys({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['message'] = message;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
