import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/views/login.dart';
import 'package:news_app/views/onboarding_screen.dart';
import 'package:news_app/views/register.dart';
import 'package:news_app/views/sensor_data.dart';
import 'package:news_app/views/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SensorDataScreen(),
    );
  }
}