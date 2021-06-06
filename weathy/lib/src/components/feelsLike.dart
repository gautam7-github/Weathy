import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class FeelsLike extends StatelessWidget {
  final dynamic feelsLike;

  const FeelsLike({
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Feels Like',
            style: kSummaryTextStyle,
          ),
        ),
        Text(
          '$feelsLike°' + kWeatherSymbol,
          style: kTempTextStyle,
        ),
      ],
    );
  }
}
