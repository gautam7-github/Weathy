import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:weathy/src/utilities/constants.dart';

class AirLevel extends StatelessWidget {
  final String aQLevel;
  final String aqiMsg;
  final double? pm25, pm10;
  AirLevel({
    required this.aQLevel,
    required this.aqiMsg,
    required this.pm25,
    required this.pm10,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: double.infinity,
        child: PageIndicatorContainer(
          length: 2,
          padding: EdgeInsets.only(bottom: 0, top: 18),
          align: IndicatorAlign.bottom,
          indicatorColor: Colors.white,
          indicatorSelectorColor: Colors.deepPurple,
          shape: IndicatorShape.circle(size: 12),
          child: PageView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Text(
                    'Air Quality Index',
                    style: kSummaryTextStyle,
                  ),
                  Text(
                    '$aQLevel',
                    style: kTempTextStyle,
                  ),
                  Text(
                    "$aqiMsg",
                    style: kSummaryTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Table(
                textBaseline: TextBaseline.alphabetic,
                border: TableBorder(
                  verticalInside: BorderSide(
                    width: 3,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              'PM 2.5',
                              style: kMessageTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              'PM 10',
                              style: kMessageTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              '$pm25',
                              style: kMessageTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              '$pm10',
                              style: kMessageTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
