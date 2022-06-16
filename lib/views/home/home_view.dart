import 'package:flutter/material.dart';

import 'package:exomind_test/views/home/widgets/home.dart';
import 'package:exomind_test/widgets/appbar/my_app_bar.dart';

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(leading: false, text: title),
      body: const Home(),
    );
  }
}
