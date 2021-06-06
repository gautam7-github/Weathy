import 'package:flutter/material.dart';
import 'package:weathy/src/screens/loading_screen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
