import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
                        "Mesajlarım",
                        style: TextStyle(fontSize: 24),
                      ),
                      Container(
                        //decoration: BoxDecoration(border: Border.all()),
                        padding: EdgeInsets.only(bottom: 20),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.search_sharp,
                            color: morDefault,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ))),
          SliverGrid.count(
            crossAxisCount: 1,
            childAspectRatio: 4,
            children: List.generate(25, (index) {
              return buildMessageListItem();
            }),
          ),
        ]),
      ),
    ));
  }

  Widget buildMessageListItem() {
    String _imageUrl =
        'https://nadiazheng.com/wp-content/uploads/2015/12/Montreal-personal-branding-linkedin-profile-professional-headshot-by-nadia-zheng-800x1000.jpg';
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                  radius: 35,
                  backgroundImage: CachedNetworkImageProvider(_imageUrl)),
            ),
            Expanded(
              flex: 8,
              child: Container(
                //decoration: BoxDecoration(border: Border.all()),
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Leyla Tekin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Konumunuz paylaşır mısınız ?",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("3 saat önce", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: morDefault,
          thickness: 0.3,
        ),
      ]),
    );
  }
}
