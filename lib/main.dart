import 'package:flutter/material.dart';
import 'package:hcr/screens/Signin.dart';
import 'package:hcr/screens/Splash.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Signin(),
    },
  ));
}
