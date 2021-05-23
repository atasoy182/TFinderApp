import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/profile_page_tabs/detail_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/general_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/program_tab_page.dart';
import 'package:tfinder_app/widgets/chewie.dart';

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
        backgroundColor: morDefault,
        pinned: false,
        automaticallyImplyLeading: false,
        expandedHeight: 250,
        brightness: Brightness.dark,
        flexibleSpace: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
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
                      height: 220,
                      width: _size.width,
                      color: morDefault,
//                      decoration: BoxDecoration(
//                          color: morDefault,
//                          borderRadius: BorderRadius.only(
//                              bottomLeft: Radius.circular(25),
//                              bottomRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 0, bottom: 5),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Profil",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          //decoration: BoxDecoration(border: Border.all()),
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            icon: Icon(
                                              Icons.dehaze,
                                              color: Colors.white,
                                              size: 35,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ))),
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
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Cristiano ronaldo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontFamily: "Raleway"),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Portekizce",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Raleway"),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 220,
                      width: _size.width,
                      alignment: Alignment.center,
                      color: morDefault,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: _size.width - 10,
                                height: 200,
                                child: ChewieVideoPlayer(
                                  videoUrl:
                                      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 15),
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: [
            Tab(
              text: "Genel",
            ),
            Tab(text: "Detay"),
            Tab(text: "Program"),
          ],
        ));
  }
}
