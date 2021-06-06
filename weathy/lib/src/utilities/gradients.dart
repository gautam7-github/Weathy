import 'package:flutter/material.dart';

const kSunnyGrd = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.3, 0.9],
  colors: [
    Color(0xFFFDC830),
    Color(0xFFF37335),
  ],
);

const kCloudyGrd = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.3, 1.0],
  colors: [
    Color(0xFF2193b0),
    Color(0xFF66a6ff),
  ],
);
const kRainyGrd = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.2, 0.7, 1.0],
  colors: [
    Color(0xFF0F2027),
    Color(0xFF203A43), //#//#
    Color(0xFF2C5364), //#
  ],
);

const kSnowyGrd = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.7, 1.0],
  colors: [
    Color(0xFFD3CCE3),
    Color(0xFFE9E4F0), //#
  ],
);
//#
// #
const kHRainyGrd = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.7, 1.0],
  colors: [
    Color(0xFF000046),
    Color(0xFF1CB5E0), //#
  ],
);
