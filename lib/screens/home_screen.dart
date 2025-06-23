import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'legendItem.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double wTemperature = 0;
  double wHumidity = 0;
  double wSoil = 0;
  double wLight = 0;
  double wWater = 0;

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  void fetchSensorData() {
    final dbRef = FirebaseDatabase.instance.ref();
    dbRef.once().then((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        wTemperature = data['wTemperature']?.toDouble() ?? 0;
        wHumidity = data['wHumidity']?.toDouble() ?? 0;
        wSoil = data['wSoil']?.toDouble() ?? 0;
        wLight = data['wLight']?.toDouble() ?? 0;
        wWater = data['wWater']?.toDouble() ?? 0;
      });
    });
  }



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
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
                        value: wTemperature,
                        color: Colors.blue,
                        title: '${wTemperature.toStringAsFixed(1)}°C',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: wSoil,
                        color: Colors.red,
                        title: '${wSoil.toStringAsFixed(1)}%',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: wHumidity,
                        color: Colors.green,
                        title: '${wHumidity.toStringAsFixed(1)}%',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: wLight,
                        color: Colors.orange,
                        title: '${wLight.toStringAsFixed(1)}',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: wWater,
                        color: Colors.purple,
                        title: '${wWater.toStringAsFixed(1)}',
                        radius: 50,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
                  LegendItem(color: Colors.purple, text: 'Water Level'),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
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
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoTile('Temperature', '${wTemperature.toStringAsFixed(1)}°C'),
                          _buildInfoTile('Humidity', '${wHumidity.toStringAsFixed(1)}%'),
                          _buildInfoTile('Soil Moisture', '${wSoil.toStringAsFixed(1)}%'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
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