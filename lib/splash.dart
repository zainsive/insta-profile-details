import 'package:flutter/material.dart';
import 'package:insta_reeler/Screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: HomeScreen(),
      title: new Text(
        'InstaReeler',
        textScaleFactor: 2,
      ),
      image: new Image.network(
          'https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
