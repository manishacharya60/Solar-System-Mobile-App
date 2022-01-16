// @dart=2.9
import 'package:flutter/material.dart';
import 'package:solar/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar/theme_changer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        defaultBrightness: Brightness.light,
        builder: (context, _brightness) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Solar System',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: _brightness,
            ),
            home: HomeScreen(),
          );
        });
  }
}
