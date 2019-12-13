import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happydormapp/dimen/dimen.dart';
import 'package:happydormapp/restaurant/providers/dormitory_providers.dart';
import 'package:happydormapp/routes/routers.dart';
import 'package:provider/provider.dart';

class RestaurantMealsContainer extends StatefulWidget {
  @override
  _RestaurantMealsContainerState createState() =>
      _RestaurantMealsContainerState();
}

class _RestaurantMealsContainerState extends State<RestaurantMealsContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double size = 100.0;
  var dormitoryMeals;
  var isBinding = true;
  final List imgList = [
    'assets/img/morning-background.jpg',
    'assets/img/morning-bread-background.jpg',
    'assets/img/lunch-background.jpg',
    'assets/img/dinner-background.jpg'
  ];
  final whenMeal = ['아침', '아침(빵)', '점심', '저녁'];

  @override
  void dispose() {
    _animationController.dispose();
    dormitoryMeals.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    dormitoryMeals = Provider.of<DormitoryProviders>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: Offset(10, height * 0),
        child: FutureBuilder(
          future: dormitoryMeals.getMealList(),
          builder: (context, mealsData) {
            if (mealsData.connectionState == ConnectionState.done)
              return Consumer<DormitoryProviders>(
                builder: (context, meals, _) => Padding(
                  padding: EdgeInsets.only(top: height * 0.15),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      width: width * 0.1,
                      height: height * 0.3,
                      child: Card(
                        key: ObjectKey(meals.orders[index].meal),
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.homePageContainerRoundRadius),
                        ),
                        elevation: Dimens.mainCardElevation,
                        child: Hero(
                          tag: Routers.heroTag[index],
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imgList[index]),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Colors.black.withOpacity(.9),
                                    Colors.black.withOpacity(.4),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      whenMeal[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.01),
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: '${meals.orders[index].meal}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '자세히 보기',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.chevron_right),
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              Routers.detailMealsInfo,
                                              arguments: {
                                                'image': imgList[index],
                                                'heroTag':
                                                    Routers.heroTag[index]
                                              },
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: meals.orders.length,
                  ),
                ),
              );
            else
              return Platform.isAndroid
                  ? Center(child: CircularProgressIndicator())
                  : Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
}
