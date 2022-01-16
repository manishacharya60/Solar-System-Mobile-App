import 'package:flutter/material.dart';
import 'package:solar/constant.dart';
import 'package:solar/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Body(),
      bottomNavigationBar: Container(
        
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
          color: navigationColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "sources/menu_icon.png",
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "sources/search_icon.png",
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "sources/profile_icon.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
