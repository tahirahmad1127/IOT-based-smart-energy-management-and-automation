import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SensorDataScreen extends StatefulWidget {
  const SensorDataScreen({Key? key}) : super(key: key);

  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref('sensorData');

  double _voltage = 0.0;
  double _current = 0.0;

  StreamSubscription<DatabaseEvent>? _databaseSubscription;

  @override
  void initState() {
    super.initState();
    _setupRealtimeListeners();
  }

  void _setupRealtimeListeners() {
    // Listen to the entire sensorData node for changes
    _databaseSubscription = _database.onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Firebase returns data as a Map<String, dynamic>
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);

        setState(() {
          // Access the values using the keys as seen in your database
          if (data.containsKey('voltage')) {
            _voltage = double.parse(data['voltage'].toString());
          }

          if (data.containsKey('current')) {
            _current = double.parse(data['current'].toString());
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _databaseSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voltage & Current Meter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Realtime Sensor Data',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildVoltageGauge(),
                ),
                Expanded(
                  child: _buildCurrentGauge(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildVoltageGauge() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      child: SfRadialGauge(
        title: const GaugeTitle(
          text: 'Voltage (V)',
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 250,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 80, color: Colors.green),
              GaugeRange(startValue: 80, endValue: 180, color: Colors.orange),
              GaugeRange(startValue: 180, endValue: 250, color: Colors.red),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: _voltage,
                enableAnimation: true,
                animationDuration: 1000,
                needleColor: Colors.green,
                knobStyle: const KnobStyle(
                  knobRadius: 0.09,
                  color: Colors.white,
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  '${_voltage.toStringAsFixed(2)} V',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentGauge() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10),
      child: SfRadialGauge(
        title: const GaugeTitle(
          text: 'Current (A)',
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 20,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 5, color: Colors.green),
              GaugeRange(startValue: 5, endValue: 15, color: Colors.orange),
              GaugeRange(startValue: 15, endValue: 20, color: Colors.red),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: _current,
                enableAnimation: true,
                animationDuration: 1000,
                needleColor: Colors.red,
                knobStyle: const KnobStyle(
                  knobRadius: 0.09,
                  color: Colors.white,
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  '${_current.toStringAsFixed(2)} A',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
            children: [
              const Text(
                'Current Values',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Table(
                border: TableBorder.all(
                  color: Colors.blueGrey.shade700,
                  width: 1,
                ),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.blue),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Parameter',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Value',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Voltage', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_voltage.toStringAsFixed(2)} V',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Current', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_current.toStringAsFixed(2)} A',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Power', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${(_voltage * _current).toStringAsFixed(2)} W',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            ),
        );
    }
}
