import 'package:flutter/material.dart';

class ColorFlagWidget extends StatelessWidget {
  const ColorFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
          width: double.maxFinite,
          color: Colors.white,
        ),
        Container(
          height: 5,
          width: double.maxFinite,
          color: Colors.blue,
        ),
        Container(
          height: 5,
          width: double.maxFinite,
          color: Colors.green[800],
        ),
      ],
    );
  }
}
