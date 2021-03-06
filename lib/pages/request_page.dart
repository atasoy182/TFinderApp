import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/fab_menu.dart';
import 'package:tfinder_app/widgets/tag_bar.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(
//          "Ders Talepleri",
//          style: TextStyle(color: Colors.white),
//        ),
//        leading: Container(),
//      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Container(
                    margin: EdgeInsets.only(top: 5, left: 5, right: 0),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Ders İstekleri",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          //decoration: BoxDecoration(border: Border.all()),
                          padding: EdgeInsets.only(bottom: 20),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.filter_list,
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
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: TagBar(
                      pageIndex: 1,
                      tagMargin:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    ))),
            buildList(items)
          ]),
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
          ),
        ),
      ),
      floatingActionButton: ExampleExpandableFab(
        tabIndex: 1,
      ),
    );
  }

  Widget buildList(List<String> items) {
    return SliverGrid.count(
      crossAxisCount: 1,
      childAspectRatio: 4 / 1.4,
      children: List.generate(100, (index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: buildListItem(),
        );
      }),
    );
  }

  Widget buildListItem() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Spacer(),
      Expanded(
        flex: 2,
        child: CircleAvatar(
            radius: 35,
            backgroundImage: CachedNetworkImageProvider(
                "https://pixomatic.us/blog/wp-content/uploads/2019/11/pixomatic_1572877223091.png")),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 6,
        child: Container(
          //decoration: BoxDecoration(border: Border.all()),
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mehmet Berkay Atasoy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "İngilizce",
                //style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "İngilizce hazırlık okuyorum. Hazırlık atlama sınavı için ders almak istiyorum.", //style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      Spacer(),
    ]);
  }
}
