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
                    color: turkuazDefault,
                  ),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: ChewieVideoPlayer(
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
