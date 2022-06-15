import 'package:exomind_test/views/meteo/meteo_view.dart';
import 'package:exomind_test/widgets/button/my_primary_button.dart';
import 'package:flutter/material.dart';

import '../../../style/my_size.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MySize().size(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Météo'),
          SizedBox(height: _size.height * 0.05),
          MyPrimaryButton(
            text: 'Cliquer ici',
            function: () => Navigator.pushNamed(
              context,
              MeteoView.route,
            ),
          ),
        ],
      ),
    );
  }
}
