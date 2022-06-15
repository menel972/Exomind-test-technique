import 'package:flutter/material.dart';

import '../../../style/my_size.dart';

class Gauge extends StatelessWidget {
  final double gaugeLoaderWidth;
  final int gaugeLoaderPercent;
  const Gauge({
    Key? key,
    required this.gaugeLoaderWidth,
    required this.gaugeLoaderPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MySize().size(context);
    Size _gaugeSize = Size(
      _size.width * 0.8,
      _size.height * 0.02,
    );

    return Stack(
      children: [
        Container(
          height: _gaugeSize.height,
          width: _gaugeSize.width,
          color: Colors.black12,
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: _gaugeSize.height,
          width: gaugeLoaderWidth,
          color: Colors.indigo,
        ),
        Positioned(
          right: 5,
          child: Text(
            '$gaugeLoaderPercent %',
          ),
        ),
      ],
    );
  }
}
