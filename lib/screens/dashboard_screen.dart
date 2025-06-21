import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vertical_farming/screens/settings_screen.dart';

import 'add_screen.dart';
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Environmental Data Overview',
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 20,
                        color: Colors.blue,
                        title: '20%',
                        radius: 50,
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        value: 25,
                        color: Colors.red,
                        title: '25%',
                        radius: 50,
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        value: 23,
                        color: Colors.green,
                        title: '23%',
                        radius: 50,
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        value: 26,
                        color: Colors.orange,
                        title: '26%',
                        radius: 50,
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        value: 24,
                        color: Colors.purple,
                        title: '24%',
                        radius: 50,
                        titleStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                    sectionsSpace: 2,
                    centerSpaceRadius: 30,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  LegendItem(color: Colors.blue, text: 'Temperature'),
                  LegendItem(color: Colors.red, text: 'Soil Moisture'),
                  LegendItem(color: Colors.green, text: 'Humidity'),
                  LegendItem(color: Colors.orange, text: 'Light Intensity'),
                  LegendItem(color: Colors.purple, text: 'CO₂ Level'),
                ],
              ),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Values',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoTile('Temperature', '26°C'),
                          _buildInfoTile('Humidity', '60%'),
                          _buildInfoTile('Soil Moisture', '45%'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade200,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

}
