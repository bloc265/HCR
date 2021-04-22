import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcr/constants/constants.dart';
import 'package:hcr/constants/global.dart';
import 'package:hcr/screens/Home.dart';
import 'package:hcr/screens/Profile.dart';
import 'package:hcr/screens/Qr.dart';
import 'package:hcr/screens/signin.dart';
import 'package:hcr/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: textColor,
        ),
        appBarTheme: AppBarTheme(
          color: textdata,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) =>
            Constants.prefs.getBool("isLoggedin") ? Home() : Signin(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/qr': (context) => Qr()
      },
    ));
  });
}
