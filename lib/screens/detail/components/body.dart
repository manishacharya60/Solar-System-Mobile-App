import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar/constant.dart';
import 'package:solar/model/planet.dart';

class Body extends StatelessWidget {
  final PlanetInfo planet;

  const Body({
    Key? key,
    required this.planet,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlewithDescription(planet: planet),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Text(
                    "Gallery",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  child: ListView.builder(
                    itemCount: planet.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            planet.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -84,
            child: Hero(
              tag: planet.position,
              child: Image.asset(
                planet.iconImage,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 50,
            child: Text(
              "${planet.position}",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headline1,
                fontWeight: FontWeight.bold,
                color: primaryTextColor.withOpacity(0.1),
                fontSize: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitlewithDescription extends StatelessWidget {
  const TitlewithDescription({
    Key? key,
    required this.planet,
  }) : super(key: key);

  final PlanetInfo planet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 250),
          Text(
            planet.name.toUpperCase(),
            style: GoogleFonts.josefinSans(
              textStyle: Theme.of(context).textTheme.headline3,
              fontWeight: FontWeight.bold,
              color: primaryTextColor.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Solar System",
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121).withOpacity(0.5),
            ),
          ),
          Divider(color: Colors.black38, thickness: 2),
          SizedBox(height: 20),
          Text(
            planet.description,
            textAlign: TextAlign.justify,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.black38, thickness: 2),
        ],
      ),
    );
  }
}
