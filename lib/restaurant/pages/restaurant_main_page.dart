import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happydormapp/animation/custom_slide_animation.dart';
import 'package:happydormapp/dimen/dimen.dart';
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
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.07, top: height * 0.02),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        builder: (context) => Container(
                          child: Text('Hello'),
                        ),
                        context: context,
                      );
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              CustomSlideAnimation(
                delay: 2.5,
                child: Align(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'assets/img/meals.png',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              CustomSlideAnimation(
                child: Align(
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
                delay: 2.7,
              ),
            ],
          ),
        ),
        RestaurantMealsContainer(),
      ],
    );
  }
}
