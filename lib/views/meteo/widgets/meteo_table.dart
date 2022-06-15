import 'package:flutter/material.dart';

class MeteoTable extends StatelessWidget {
  const MeteoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
