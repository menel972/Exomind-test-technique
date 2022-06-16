import 'package:flutter/material.dart';

import 'package:exomind_test/services/bloc/bloc_provider.dart';
import 'package:exomind_test/services/bloc/provided/timer_bloc.dart';

import 'package:exomind_test/views/meteo/widgets/meteo.dart';
import 'package:exomind_test/widgets/appbar/my_app_bar.dart';

class MeteoView extends StatelessWidget {
  static const route = './meteo';
  const MeteoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(leading: true, text: 'Météo'),
      body: BlocProvider<TimerBloc>(
        bloc: TimerBloc(),
        child: Meteo(),
      ),
    );
  }
}
