import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tast_app/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User App',
      home: HomeScreen(),
    );
  }
}
