import 'package:flutter/material.dart';
import 'package:weathy/src/utilities/constants.dart';

class TopBar extends StatelessWidget {
  final String? cityName;
  final Function onP;
  TopBar({required this.cityName, required this.onP});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 32,
                ),
                Center(
                  child: Text(
                    '$cityName',
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
