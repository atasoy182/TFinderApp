import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/chewie.dart';

class ProfileEditDigerTab extends StatefulWidget {
  const ProfileEditDigerTab({Key key}) : super(key: key);

  @override
  _ProfileEditDigerTabState createState() => _ProfileEditDigerTabState();
}

class _ProfileEditDigerTabState extends State<ProfileEditDigerTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Profil resmini değiştir
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 7,
                  child: ChewieVideoPlayer(
                    videoUrl:
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.link),
                                    title: new Text('URL linkinden getir'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: new Text('Galeriden Video Seç'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: new Text('Kameradan Video Çek'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.highlight_remove),
                                    title: new Text('Tanıtım Videosu Kaldır'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Tanıtım Videosunu Değiştir',
                        style: TextStyle(color: defaultLink, fontSize: 18),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
