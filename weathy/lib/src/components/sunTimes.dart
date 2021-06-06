import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class SunTimes extends StatelessWidget {
  final dynamic sunRise;
  final dynamic sunSet;
  SunTimes({required this.sunRise, required this.sunSet});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            Center(
              child: Text(
                'Sunrise',
                style: kSummaryTextStyle,
              ),
            ),
            Text(
              '$sunRise' + kWeatherSymbol,
              style: kTempTextStyle,
            ),
          ],
        ),
        SizedBox(height: 100),
        Column(
          children: <Widget>[
            Center(
              child: Text(
                'Sunset',
                style: kSummaryTextStyle,
              ),
            ),
            Text(
              '$sunSet' + kWeatherSymbol,
              style: kTempTextStyle,
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
