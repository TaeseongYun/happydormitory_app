import 'package:flutter/material.dart';
import 'package:happydormapp/animation/custom_fade_animation.dart';

class DetailMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hegith = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final image =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    // print(image);
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: image['heroTag'],
          child: Container(
            width: double.infinity,
            height: hegith,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(image['image']),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.0),
                  ],
                  begin: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: hegith * 0.07,
                      horizontal: width * 0.06,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: width,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CustomFadeAnimation(
                            delay: 1.3,
                            child: Text(
                              image['whenMeal'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: hegith * 0.02,
                          ),
                          CustomFadeAnimation(
                            child: Text(
                              image['meals'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            delay: 1.4,
                          ),
                          SizedBox(
                            height: hegith * 0.02,
                          )
                        ],
                      ),
                    ),
                    height: hegith * 0.6,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
