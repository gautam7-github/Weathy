import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';
import 'dart:math';

class WindBar extends StatelessWidget {
  final dynamic degree;
  const WindBar({required this.degree});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Wind',
            style: kSummaryTextStyle,
          ),
        ),
        Transform.rotate(
          angle: degree * (pi / 180.0),
          child: Icon(
            Icons.arrow_circle_up_rounded,
            color: Colors.white,
            size: 100.0,
          ),
        ),
        Center(
          child: Text(
            '${degree.round()}°',
            style: kSummaryTextStyle,
          ),
        ),
      ],
    );
  }
}
