import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/searh_bar.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Align(
              child: Column(
                children: [
                  baslikText(context),
                  aramaSatiri(size),
                  TagBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row aramaSatiri(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: size.width * 3 / 4, child: SearchBar()),
        Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            alignment: Alignment.center,
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: topViewColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned.fill(
              child: Icon(
            Icons.filter_list_sharp,
            size: 45,
            color: Colors.white,
          ))
        ]),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Text baslikText(BuildContext context) {
    return Text(
      "Öğretmen Ara",
      style: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}

//Text(
//"En iyi öğretmenler ile tanışmak artık çok kolay !",
//style: Theme.of(context).textTheme.bodyText1,
//textAlign: TextAlign.center,
//)
