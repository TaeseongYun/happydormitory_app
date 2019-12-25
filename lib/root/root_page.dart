import 'package:flutter/material.dart';
import 'package:happydormapp/detail/pages/detail_meal_page.dart';
import 'package:happydormapp/routes/routers.dart';
import '../home/pages/home_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      routes: {
        Routers.detailMealsInfo: (context) => DetailMealPage(),
      },
    );
  }
}
