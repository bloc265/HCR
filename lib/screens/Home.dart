import 'package:flutter/material.dart';
import 'package:hcr/constants/constants.dart';
import 'package:hcr/constants/global.dart';
import 'package:hcr/widgets/cards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HCR',
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Constants.prefs.setBool("isLoggedin", false);
              Constants.prefs.setString("token", null);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Icon(
              Icons.logout,
              color: textColor,
            ),
          )
        ],
      ),
      body: tabBodies[_currentTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: textdata,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.7),
              offset: Offset(1.5, 1.8),
              blurRadius: 20.9,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 40.7,
          iconSize: 31,
          unselectedItemColor: textColor,
          currentIndex: _currentTab,
          selectedItemColor: redish,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              _currentTab = index;
            });
          },
        ),
      ),
    );
  }

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: "")
  ];

  final List tabBodies = [
    Cards(),
    Container(color: redish),
    Container(
      color: Colors.blue,
    )
  ];
}
