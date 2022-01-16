import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar/constant.dart';
import 'package:solar/model/planet.dart';
import 'package:solar/screens/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final PlanetInfo planet;

  const DetailScreen({
    Key? key,
    required this.planet,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        planet: planet,
      ),
    );
  }
}
