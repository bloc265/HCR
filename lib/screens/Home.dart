import 'package:flutter/material.dart';
import 'package:hcr/constants/global.dart';
import 'package:hcr/widgets/cards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HCR',
          style: TextStyle(color: black),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              print('logout');
            },
            child: Icon(
              Icons.logout,
              color: textColor,
            ),
          )
        ],
      ),
      body: Cards(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 40.7,
        iconSize: 31,
        unselectedItemColor: textColor,
        currentIndex: _currentTab,
        selectedItemColor: redish,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              title: SizedBox.shrink())
        ],
      ),
    );
  }
}
