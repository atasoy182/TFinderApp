import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';
import 'package:tfinder_app/widgets/teaher_list_view.dart';
import 'package:tfinder_app/widgets/top_teachers_view.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromRGBO(65, 202, 198, 1),
                Color.fromRGBO(65, 202, 198, 0.7),
                Color.fromRGBO(65, 202, 198, 0.5),
              ])),
            ),
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
              child:
                  Container(margin: EdgeInsets.all(15), child: TopTeachers())),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TagBar())),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return TeacherListItem(index: index);
              },
              childCount: 1000, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
