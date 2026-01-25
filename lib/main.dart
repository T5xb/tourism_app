import 'package:flutter/material.dart';
import 'package:tourism_app/screens/home_screen.dart';

void main() {
  runApp(TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudi Tourism',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}
