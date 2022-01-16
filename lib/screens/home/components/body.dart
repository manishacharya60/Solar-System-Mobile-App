import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar/constant.dart';
import 'package:solar/model/planet.dart';
import 'package:solar/screens/detail/detail_screen.dart';
import 'package:solar/screens/home/components/title_and_drop_down.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientStartColor,
            gradientEndColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.7],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleandDropDown(),
            Container(
              height: 500,
              padding: EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: gradientStartColor.withOpacity(0.7),
                    activeSize: 18,
                  ),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(planet: planets[index]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100),
                            Card(
                              color: Colors.white,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 130),
                                    Text(
                                      planets[index].name,
                                      style: GoogleFonts.josefinSans(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color(0xFF212121).withOpacity(0.8),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Solar System",
                                      style: GoogleFonts.lato(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color(0xFF212121).withOpacity(0.5),
                                      ),
                                    ),
                                    
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "Know More",
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .button,
                                            color: secondaryTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: size.width * 0.10,
                          bottom: size.height * 0.16,
                          child: Text(
                            "${planets[index].position}",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF212121).withOpacity(0.1),
                            ),
                          ),
                        ),
                        Hero(
                          tag: planets[index].position,
                          child: Image.asset(planets[index].iconImage),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
