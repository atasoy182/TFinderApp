import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';
import 'package:tfinder_app/widgets/teaher_list_view.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
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
            backgroundColor: turkuazDefault,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Mesajlaşma',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilim',
            backgroundColor: profilRenk,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: turkuazDefault,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(context),
        SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(top: 5, left: 15, right: 15),
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
