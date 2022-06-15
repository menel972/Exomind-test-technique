import 'package:exomind_test/services/bloc/provided/weather_bloc.dart';
import 'package:flutter/material.dart';

import '../../../services/bloc/bloc_provider.dart';

class MeteoTable extends StatelessWidget {
  const MeteoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BLoC
    final _bloc = BlocProvider.of<WeatherBloc>(context);
    _bloc.getParisWeather();
    return Center(
      child: Table(
        border: TableBorder.all(),
        children: const [
          TableRow(
            children: [
              Text('Paris'),
              Text('Température'),
              Text('Nuages'),
            ],
          ),
          TableRow(
            children: [
              Text('Paris'),
              Text('Température'),
              Text('Nuages'),
            ],
          ),
          TableRow(
            children: [
              Text('Paris'),
              Text('Température'),
              Text('Nuages'),
            ],
          ),
          TableRow(
            children: [
              Text('Paris'),
              Text('Température'),
              Text('Nuages'),
            ],
          ),
          TableRow(
            children: [
              Text('Paris'),
              Text('Température'),
              Text('Nuages'),
            ],
          ),
        ],
      ),
    );
  }
}
