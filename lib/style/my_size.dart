import 'package:flutter/material.dart';

class MySize {
  ///Get the size of my screen
  Size size(BuildContext context) => Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );
}
