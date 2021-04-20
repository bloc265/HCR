import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcr/constants/constants.dart';
import 'package:hcr/screens/signin.dart';
import 'package:hcr/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Signin(),
      },
    ));
  });
}
