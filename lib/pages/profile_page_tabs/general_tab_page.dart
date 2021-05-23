import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class ProfileGeneralTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
//      SliverToBoxAdapter(
//        child: Container(
//          //color: Colors.red,
//          height: 200,
//          width: double.infinity,
//          child: ChewieVideoPlayer(
//            videoUrl:
//                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
//          ),
//        ),
//      ),
//      SliverToBoxAdapter(
//        child: Container(
//          //color: Colors.red,
//          height: 80,
//          width: 100,
//          child: Row(
//            children: [
//              Expanded(
//                flex: 2,
//                child: CircleAvatar(
//                    radius: 50,
//                    backgroundImage: CachedNetworkImageProvider(_imageUrl)),
//              ),
//              Expanded(flex: 8, child: Container()),
//            ],
//          ),
//        ),
//      ),
      SliverGrid.count(
        crossAxisCount: 1,
        childAspectRatio: 4 / 1.4,
        children: List.generate(100, (index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 50,
              child: Center(
                child: Text("Some text here"),
              ),
            ),
          );
        }),
      ),
    ]);
  }
}
