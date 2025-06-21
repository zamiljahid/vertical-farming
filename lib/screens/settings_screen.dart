import 'dart:ui';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _soilMoistureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _lightController = TextEditingController();
  final TextEditingController _co2Controller = TextEditingController();

  void _applySettings() {
    if (_formKey.currentState!.validate()) {
      final temp = _temperatureController.text;
      final soil = _soilMoistureController.text;
      final humidity = _humidityController.text;
      final light = _lightController.text;
      final co2 = _co2Controller.text;
      print('Temperature: $temp');
      print('Soil Moisture: $soil');
      print('Humidity: $humidity');
      print('Light: $light');
      print('CO₂: $co2');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Settings applied successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTextField('Temperature', _temperatureController),
            SizedBox(
              height: 5,
            ),
            _buildTextField('Soil Moisture', _soilMoistureController),
            SizedBox(
              height: 5,
            ),
            _buildTextField('Humidity', _humidityController),
            SizedBox(
              height: 5,
            ),
            _buildTextField('Light Intensity', _lightController),
            SizedBox(
              height: 5,
            ),
            _buildTextField('CO₂ Level', _co2Controller),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applySettings,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F2027),
                foregroundColor: Colors.white,
              ),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:Color(0xFF203A43).withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFF2C5364).withOpacity(0.3),
              ),
            ),
            child: TextFormField(
              controller: controller,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF2C5364)), // white border when not focused
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // red border when focused
                ),
                border: const OutlineInputBorder(), // fallback
              ),
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
            )),
      ),
    );
  }
}
