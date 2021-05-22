import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/pages/profile_page_tabs/detail_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/general_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/program_tab_page.dart';
import 'package:tfinder_app/widgets/chewie.dart';
import 'package:tfinder_app/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String _imageUrl =
        'https://nadiazheng.com/wp-content/uploads/2015/12/Montreal-personal-branding-linkedin-profile-professional-headshot-by-nadia-zheng-800x1000.jpg';
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
            ),
            child: Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Profilim",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          //decoration: BoxDecoration(border: Border.all()),
                          padding: EdgeInsets.only(bottom: 20),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.settings,
                              color: turkuazDefault,
                              size: 35,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )),
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
                      ProfileGeneralTab(
                        imageUrl: _imageUrl,
                      ),
                      ProfileDetailTab(),
                      ProfileProgramTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
