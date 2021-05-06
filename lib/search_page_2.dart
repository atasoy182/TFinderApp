import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/searh_bar.dart';

class SearchPage2 extends StatefulWidget {
  @override
  _SearchPage2State createState() => _SearchPage2State();
}

class _SearchPage2State extends State<SearchPage2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: turkuazDefault,
            title: Text(
              "Bul",
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                return Navigator.of(context).pop();
              },
            ),
            floating: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {},
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(child: Container()),
        ],
      ),
    );
  }

  Widget filterIcon() {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: turuncuDefault,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Positioned.fill(
          child: Icon(
        Icons.filter_list_sharp,
        size: 45,
        color: Colors.white,
      ))
    ]);
  }
}
