import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happydormapp/animation/custom_slide_animation.dart';
import 'package:happydormapp/restaurant/widgets/restaurant_bottom_sheet.dart';
import 'package:happydormapp/restaurant/widgets/restaurant_meals_container.dart';

class RestaurantMainPage extends StatefulWidget {
  @override
  _RestaurantMainPageState createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  var isLoading = false;
  var isClicked = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Positioned(
          top: Platform.isAndroid ? height * 0.19 : height * 0.18,
          // right: -width * 0.20,
          left: width * 0.2,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomSlideAnimation(
                  delay: 2.5,
                  child: Align(
                    child: Container(
                      child: Text(
                        '오늘의 식단',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: width * 0.85,
          top: height * 0.1,
          child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => RestaurantBottomSheet(),
                );
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ),
        RestaurantMealsContainer(),
      ],
    );
  }
}
