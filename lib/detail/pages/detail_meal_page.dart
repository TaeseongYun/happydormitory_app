import 'package:flutter/material.dart';

class DetailMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hegith = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final image =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    // print(image);
    return Scaffold(
      body: Hero(
        tag: image['heroTag'],
        child: Container(
          width: double.infinity,
          height: hegith,
          child: Container(
            decoration: BoxDecoration(
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
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
