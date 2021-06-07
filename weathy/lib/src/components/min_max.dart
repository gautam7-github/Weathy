import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class MinMaxData extends StatelessWidget {
  final dynamic max;
  final dynamic min;
  MinMaxData({required this.max, required this.min});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: double.infinity,
        child: Center(
          child: PageView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
              Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
