import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:weathy/src/utilities/constants.dart';

class SunTimes extends StatelessWidget {
  final dynamic sunRise;
  final dynamic sunSet;
  SunTimes({required this.sunRise, required this.sunSet});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300.0,
        width: double.infinity,
        child: Center(
          child: PageIndicatorContainer(
            length: 2,
            padding: EdgeInsets.only(bottom: 0, top: 16),
            align: IndicatorAlign.bottom,
            indicatorColor: Colors.white,
            indicatorSelectorColor: Colors.deepPurple,
            shape: IndicatorShape.circle(size: 12),
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: ImageIcon(
                        AssetImage("images/sunrise.png"),
                        size: 144,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$sunRise',
                      style: kTempTextStyle.copyWith(fontSize: 56),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: ImageIcon(
                        AssetImage("images/sunset.png"),
                        color: Colors.white,
                        size: 144,
                      ),
                    ),
                    Text(
                      '$sunSet',
                      style: kTempTextStyle.copyWith(fontSize: 56),
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
