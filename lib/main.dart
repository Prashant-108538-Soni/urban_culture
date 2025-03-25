import 'package:flutter/material.dart';
import 'package:urban_culture/presentation/view/urban_root_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skincare Tracker',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const UrbanRootScreen(),
    );
  }
}
