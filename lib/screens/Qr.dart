import 'package:flutter/material.dart';
import 'package:hcr/constants/constants.dart';
import 'package:hcr/constants/global.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'HCR',
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: QrImage(
        data: "12345789",
        version: QrVersions.auto,
        foregroundColor: textColor,
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      )),
    );
  }
}
