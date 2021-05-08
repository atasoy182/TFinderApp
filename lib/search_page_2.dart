import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';
import 'package:tfinder_app/widgets/top_teachers_view.dart';

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
                  Icons.search_sharp,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {},
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TagBar())),
          SliverToBoxAdapter(
              child:
                  Container(margin: EdgeInsets.all(15), child: TopTeachers())),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(15),
                  child: Container(
                    color: Colors.blue[100 * (index % 9 + 1)],
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Item $index",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
              childCount: 1000, // 1000 list items
            ),
          ),
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
