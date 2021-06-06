import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class MinMaxData extends StatelessWidget {
  final dynamic max;
  final dynamic min;
  MinMaxData({required this.max, required this.min});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            Center(
              child: Text(
                'Max',
                style: kSummaryTextStyle,
              ),
            ),
            Text(
              '${max.round()}°' + kWeatherSymbol,
              style: kTempTextStyle,
            ),
          ],
        ),
        SizedBox(height: 100),
        Column(
          children: <Widget>[
            Center(
              child: Text(
                'Min',
                style: kSummaryTextStyle,
              ),
            ),
            Text(
              '${min.round()}°' + kWeatherSymbol,
              style: kTempTextStyle,
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
