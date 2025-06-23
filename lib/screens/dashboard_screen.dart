import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vertical_farming/screens/settings_screen.dart';

import 'add_screen.dart';
import 'home_screen.dart';
import 'legendItem.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    AddPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.add, size: 30),
    ];
    return Scaffold(
      body: Container(decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027),
            Color(0xFF203A43),
            Color(0xFF2C5364)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
          child: Center(child: _pages[_selectedIndex])),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Color(0xFF2C5364))),
        child: CurvedNavigationBar(
          color: Color(0xFF0F2027) ,
          buttonBackgroundColor: Color(0xFF0F2027),
          backgroundColor: Color(0xFF2C5364),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          height: 60,
          index: _selectedIndex,
          items: items,
          onTap: (index) => setState(() => this._selectedIndex = index),
        ),
      ),
    );
  }
}

