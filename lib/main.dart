import 'package:flutter/material.dart';
import 'package:hcr/screens/signin.dart';
import 'package:hcr/screens/splash.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Signin(),
    },
  ));
}
