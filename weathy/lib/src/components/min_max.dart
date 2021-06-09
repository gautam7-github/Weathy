import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';
import 'package:page_indicator/page_indicator.dart';

class MinMaxData extends StatelessWidget {
  final pageController = PageController();
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
          child: PageIndicatorContainer(
            length: 2,
            padding: EdgeInsets.only(bottom: 0, top: 18),
            align: IndicatorAlign.bottom,
            indicatorColor: Colors.white,
            indicatorSelectorColor: Colors.deepPurple,
            shape: IndicatorShape.circle(size: 12),
            child: PageView(
              controller: pageController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Column(
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
                Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
