import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/locations_page.dart';
import 'package:tfinder_app/pages/profile_page.dart';
import 'package:tfinder_app/pages/request_page.dart';
import 'package:tfinder_app/widgets/searh_bar.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';
import 'package:tfinder_app/widgets/teaher_list_view.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    SearchPageBody(),
    RequestPage(),
    LocationsPage(),
    ProfilePage(
      pageMode: ProfilePageMode.Degistir,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: turuncuDefault,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/megaphone.png"),
              size: 20,
            ),
            label: 'Talepler',
            backgroundColor: yesilDefault,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Yakınımda',
            backgroundColor: turkuazDefault,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilim',
            backgroundColor: morDefault,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: turkuazDefault,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SearchPageBody extends StatefulWidget {
  @override
  _SearchPageBodyState createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          //buildSliverAppBar(context),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 5, left: 15, right: 25),
                  child: SearchBar())),
          SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: TagBar(
                    pageIndex: 0,
                  ))),
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

SliverAppBar buildSliverAppBar(BuildContext context) {
  return SliverAppBar(
    brightness: Brightness.light,
    flexibleSpace: Container(
      color: Colors.white,
//            decoration: BoxDecoration(
//                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//              Color.fromRGBO(65, 202, 198, 1),
//              Color.fromRGBO(65, 202, 198, 0.7),
//              Color.fromRGBO(65, 202, 198, 0.5),
//            ])),
    ),
    title: Text(
      "Bul",
      style: TextStyle(color: Colors.black),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        return Navigator.of(context).pop();
      },
    ),
    floating: true,
    actions: [
      IconButton(
        icon: Icon(
          Icons.search_sharp,
          color: Colors.black,
          size: 32,
        ),
        onPressed: () {},
      ),
      Container(
        margin: EdgeInsets.only(right: 10),
        child: IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
