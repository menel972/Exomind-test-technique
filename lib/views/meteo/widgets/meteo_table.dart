import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exomind_test/services/api/weather_api.dart';
import 'package:exomind_test/services/provider/city_provider.dart';

import '../../../services/models/weather/weather_response.dart';

class MeteoTable extends StatelessWidget {
  final num loadingValue;
  const MeteoTable({Key? key, required this.loadingValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    ///
    /// All citie's data
    ///
    WeatherResponse? par = Provider.of<CityProvider>(context).par;
    WeatherResponse? bor = Provider.of<CityProvider>(context).bor;
    WeatherResponse? lon = Provider.of<CityProvider>(context).lon;
    WeatherResponse? was = Provider.of<CityProvider>(context).was;
    WeatherResponse? mar = Provider.of<CityProvider>(context).mar;

    ///
    ///Used to set all citie's data
    ///
    void setParis(WeatherResponse data) =>
        Provider.of<CityProvider>(context, listen: false).setParisData(data);
    void setBordeaux(WeatherResponse data) =>
        Provider.of<CityProvider>(context, listen: false).setBordeauxData(data);
    void setLondon(WeatherResponse data) =>
        Provider.of<CityProvider>(context, listen: false).setLondonData(data);
    void setWashington(WeatherResponse data) =>
        Provider.of<CityProvider>(context, listen: false)
            .setWashingtonData(data);
    void setMarsaAlam(WeatherResponse data) =>
        Provider.of<CityProvider>(context, listen: false)
            .setMarsaAlamData(data);

    ///
    /// Used to fecth data from the API an save it in the provider
    ///
    setParisData() async {
      WeatherResponse paris = await WeatherApi().fetchParisWeather();
      setParis(paris);
    }

    setBordeauxData() async {
      WeatherResponse bdx = await WeatherApi().fetchBordeauxWeather();
      setBordeaux(bdx);
    }

    setLondonData() async {
      WeatherResponse london = await WeatherApi().fetchLondonWeather();
      setLondon(london);
    }

    setWashingtonData() async {
      WeatherResponse washington = await WeatherApi().fetchWashingtonWeather();
      setWashington(washington);
    }

    setMarsaAlamData() async {
      WeatherResponse marsaAlam = await WeatherApi().fetchMarsaAlamWeather();
      setMarsaAlam(marsaAlam);
    }

    ///
    /// Get cities data each 10 sec
    ///
    getData() async {
      if (loadingValue == 0) setParisData();
      if (loadingValue == 10) setBordeauxData();
      if (loadingValue == 20) setLondonData();
      if (loadingValue == 30) setWashingtonData();
      if (loadingValue == 40) setMarsaAlamData();
    }

    getData();

    // defines if the gauge still loading
    final isLoading = loadingValue < 60;

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Text(par!.name!),
                    Text('${par.main!.temp} °C'),
                    Text('${par.weather![0].description}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text(bor!.name!),
                    Text('${bor.main!.temp} °C'),
                    Text('${bor.weather![0].description}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text(lon!.name!),
                    Text('${lon.main!.temp} °C'),
                    Text('${lon.weather![0].description}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text(was!.name!),
                    Text('${was.main!.temp} °C'),
                    Text('${was.weather![0].description}'),
                  ],
                ),
                TableRow(
                  children: [
                    Text(mar!.name!),
                    Text('${mar.main!.temp} °C'),
                    Text('${mar.weather![0].description}'),
                  ],
                ),
              ],
            ),
          );
  }
}
