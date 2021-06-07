import 'package:flutter/material.dart';
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
          child: PageView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
