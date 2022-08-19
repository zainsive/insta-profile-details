import 'package:flutter/material.dart';
import 'package:insta_reeler/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "InstaReeler",
        home: SplashScreenMain(),
        debugShowCheckedModeBanner: false);
  }
}
