import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/pages/profile_page_tabs/detail_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/general_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/program_tab_page.dart';
import 'package:tfinder_app/widgets/chewie.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              buildSliverAppBarForProfilePage(_size),
            ];
          },
          body: buildBodyForProfilePage(),
        ),
      ),
    );
  }

  Container buildBodyForProfilePage() {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: TabBar(
              tabs: [
                Tab(text: "Genel"),
                Tab(text: "Detay"),
                Tab(text: "Program"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ProfileGeneralTab(),
                ProfileDetailTab(),
                ProfileProgramTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBarForProfilePage(Size _size) {
    String _ronaldoUrl =
        "https://besthqwallpapers.com/Uploads/8-1-2019/76914/thumb2-cristiano-ronaldo-portrait-photo-shoot-portuguese-football-player-smile.jpg";
    return SliverAppBar(
      pinned: false,
      automaticallyImplyLeading: false,
      expandedHeight: 250,
      flexibleSpace: SafeArea(
        child: Container(
          color: Colors.white,
          child: NotificationListener(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                children: [
                  Container(
                    height: 200,
                    width: _size.width,
                    decoration: BoxDecoration(
                        gradient: defaultTurkuazGradient,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(top: 5, left: 5, right: 0),
                            height: 30,
                            child: Container(
                              alignment: Alignment.centerRight,
                              //decoration: BoxDecoration(border: Border.all()),
                              padding: EdgeInsets.only(bottom: 20),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              imageUrl: _ronaldoUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Cristiano ronaldo",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontFamily: "Raleway"),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Cristiano ronaldo",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Raleway"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: _size.width,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: SizedBox(
                      width: _size.width - 10,
                      child: ChewieVideoPlayer(
                        videoUrl:
                            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
