import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:happydormapp/movies/pages/movie_main_page.dart';
import 'package:happydormapp/restaurant/pages/restaurant_main_page.dart';
// import '../widgets/bottom_navi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  final _pageController = PageController();
  final pageList = [RestaurantMainPage(), MovieMainPage()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        itemCornerRadius: 20,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        animationDuration: Duration(milliseconds: 1000),
        showElevation: true,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.restaurant,
            ),
            title: Text('식단'),
            activeColor: Colors.cyan,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.movie),
            title: Text('영화'),
            activeColor: Colors.green,
          )
        ],
        onItemSelected: (index) => setState(
          () {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 1000),
            );
          },
        ),
      ),
      body: PageView.builder(
        itemCount: pageList.length,
        onPageChanged: (index) => setState(
          () {
            _selectedIndex = index;
            _pageController.animateToPage(
              _selectedIndex,
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 1000),
            );
          },
        ),
        pageSnapping: false,
        reverse: false,
        allowImplicitScrolling: false,
        itemBuilder: (context, index) => pageList[index],
        controller: _pageController,
      ),
    );
  }
}
