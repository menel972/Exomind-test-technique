import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exomind_test/services/provider/city_provider.dart';
import 'package:exomind_test/views/home/home_view.dart';
import 'package:exomind_test/views/meteo/meteo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // title of the application
  final String title = 'Exomind Test Technique';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case MeteoView.route:
              return MaterialPageRoute(builder: (context) => const MeteoView());
            default:
              return null;
          }
        },
        home: HomeView(title: title),
      ),
    );
  }
}
