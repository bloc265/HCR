import 'package:flutter/material.dart';
import 'package:hcr/constants/global.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future wait() async {
    await Future.delayed(Duration(seconds: 4),
        () => {Navigator.pushReplacementNamed(context, '/login')});
  }

  @override
  void initState() {
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'HCR',
        style: TextStyle(
            color: textColor,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            fontSize: 40),
      ),
    ));
  }
}
