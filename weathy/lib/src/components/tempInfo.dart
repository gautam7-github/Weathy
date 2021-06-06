import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class TempInfo extends StatelessWidget {
  final String? weatherIcon;
  final String? weatherSummary;
  final dynamic temp;
  TempInfo({
    required this.weatherIcon,
    required this.weatherSummary,
    required this.temp,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$weatherIcon',
          style: kConditionTextStyle,
        ),
        Center(
          child: Text(
            weatherSummary.toString().toUpperCase(),
            style: kSummaryTextStyle,
          ),
        ),
        Text(
          '$temp°' + kWeatherSymbol,
          style: kTempTextStyle,
        ),
      ],
    );
  }
}
