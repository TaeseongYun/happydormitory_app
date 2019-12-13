import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happydormapp/dimen/dimen.dart';
import 'package:happydormapp/restaurant/widgets/restaurant_meals_container.dart';

class RestaurantMainPage extends StatefulWidget {
  @override
  _RestaurantMainPageState createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // children: <Widget>[],
      children: <Widget>[
        Container(
          padding: Platform.isAndroid
              ? EdgeInsets.only(top: Dimens.androidHomePagePaddingTop)
              : EdgeInsets.only(top: Dimens.iOSHomePagePaddingTop),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                child: Container(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    'assets/img/meals.png',
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '행복기숙사 식단',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        RestaurantMealsContainer(),
      ],
    );
  }
}
