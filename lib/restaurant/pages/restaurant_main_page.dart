import 'package:flutter/material.dart';
import 'package:happydormapp/dimen/dimen.dart';

class RestaurantMainPage extends StatefulWidget {
  @override
  _RestaurantMainPageState createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = !isLoading;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      // children: <Widget>[],
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: Dimens.homePagePaddingTop),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan[300],
                Colors.green[300],
                // Colors.transparent,
              ],
              begin: Alignment.topCenter,
            ),
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
                    color: Colors.white,
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
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
            offset: Offset(0, 0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimens.homePageContainerRoundRadius,
                  ),
                  topRight: Radius.circular(
                    Dimens.homePageContainerRoundRadius,
                  ),
                  // Dimens.homePageContainerRoundRadius,
                ),
              ),
              width: double.infinity,
              height: isLoading ? height * 0.65 : height * 0.1,
              // color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
