import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      length: 2,
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
                              color: yesilDefault,
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
                      Tab(text: "Call"),
                      Tab(text: "Message"),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ProfileTabPage1(
                        imageUrl: _imageUrl,
                      ),
                      Text(" Hİ"),
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

class ProfileTabPage1 extends StatelessWidget {
  const ProfileTabPage1({
    Key key,
    @required String imageUrl,
  })  : _imageUrl = imageUrl,
        super(key: key);

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Container(
          //color: Colors.red,
          height: 200,
          width: double.infinity,
          child: ChewieVideoPlayer(
            videoUrl:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          //color: Colors.red,
          height: 80,
          width: 100,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(_imageUrl)),
              ),
              Expanded(flex: 8, child: Container()),
            ],
          ),
        ),
      ),
      SliverGrid.count(
        crossAxisCount: 1,
        childAspectRatio: 4 / 1.4,
        children: List.generate(100, (index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 50,
              color: Colors.green,
            ),
          );
        }),
      ),
    ]);
  }
}
