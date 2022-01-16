import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar/constant.dart';
import 'package:solar/theme_changer.dart';

class TitleandDropDown extends StatelessWidget {
  const TitleandDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Explore",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.headline3,
                  fontWeight: FontWeight.bold,
                  color: titleTextColor,
                ),
              ),
              
              Switch(
                value: ThemeBuilder.of(context)!.isDark,
                onChanged: (value) {
                  ThemeBuilder.of(context)!.changeTheme();
                },
              ),
            ],
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text(
                  "Solar System",
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFAFAFA).withOpacity(0.7),
                  ),
                ),
              ),
            ],
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            underline: SizedBox(),
          ),
        ],
      ),
    );
  }
}
