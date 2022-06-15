import 'package:exomind_test/views/meteo/widgets/gauge.dart';
import 'package:exomind_test/widgets/button/my_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../services/bloc/bloc_provider.dart';
import '../../../services/bloc/provided/timer_bloc.dart';
import '../../../style/my_size.dart';
import 'meteo_table.dart';

class Meteo extends StatelessWidget {
  Meteo({Key? key}) : super(key: key);

  /// Messages used to make the user wait
  final List<String> _waitingMessage = [
    '',
    'Nous téléchargeons les données…',
    'C’est presque fini…',
    'Plus que quelques secondes avant d’avoir le résultat…',
    'Les données sont prêtes…',
  ];

  /// Index of the waitingMessage
  int _waitingIndex(num value) {
    int ratio = value ~/ 6;

    if (value == 60) return 4;
    if (ratio % 2 == 0) return 1;
    if (ratio % 2 == 1) return 2;
    if (ratio % 2 == 2) return 3;
    return 0;
  }

  Widget switchReloadGauge(
      {required num value,
      required VoidCallback function,
      required double width,
      required int percent}) {
    return value == 60
        ? MyIconButton(
            icon: Icons.refresh,
            function: function,
          )
        : Gauge(gaugeLoaderWidth: width, gaugeLoaderPercent: percent);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MySize().size(context);

    /// BLoC
    final _bloc = BlocProvider.of<TimerBloc>(context);

    return StreamBuilder<num>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          num _value = snapshot.data!;

          /// Elovolutive gauge width
          double gaugeLoaderWidth() {
            double facteur = _size.width * 0.8 / 60;
            return _value * facteur;
          }

          /// Loaded data percentage
          int gaugeLoaderPercent() {
            double percent = (_value * 100) / 60;
            return percent.toInt();
          }

          return ListView.separated(
            itemCount: 3,
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.05, horizontal: _size.width * 0.1),
            separatorBuilder: (context, i) {
              if (i == 0) return SizedBox(height: _size.height * 0.7);
              return SizedBox(height: _size.height * 0.02);
            },
            itemBuilder: (context, i) => [
              const MeteoTable(),
              Text(
                _waitingMessage[_waitingIndex(_value)],
                textAlign: TextAlign.center,
              ),
              switchReloadGauge(
                value: _value,
                function: () => _bloc.startTimer(),
                width: gaugeLoaderWidth(),
                percent: gaugeLoaderPercent(),
              ),
            ][i],
          );
        });
  }
}
