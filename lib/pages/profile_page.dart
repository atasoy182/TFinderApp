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
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
          right: 5,
          top: 5,
        ),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Container(
                  margin:
                      EdgeInsets.only(top: 5, left: 5, right: 0, bottom: 15),
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
                  ))),
          SliverToBoxAdapter(
              child: Container(
                  //color: Colors.red,
                  height: 250,
                  width: double.infinity,
                  child: ChewieVideoPlayer(
                    videoUrl:
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  ))),
        ]),
      ),
    ));
  }
}
