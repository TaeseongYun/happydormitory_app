import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantBottomSheet extends StatefulWidget {
  @override
  _RestaurantBottomSheetState createState() => _RestaurantBottomSheetState();
}

class _RestaurantBottomSheetState extends State<RestaurantBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(10),
      height: height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              '\t\t해당 어플리케이션은\n개인이 제작하였습니다.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: Text('어플리케이션에 문제가 있을 시'),
          ),
          Padding(
            child: Text('아래 링크로 연락주세요 :)'),
            padding: EdgeInsets.only(top: height * 0.03),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Linkify(
              text: 'https://open.kakao.com/o/s3Sf3ePb',
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else
                  throw 'Could not launch $link';
              },
            ),
          )
        ],
      ),
    );
  }
}
