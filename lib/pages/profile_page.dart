import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/locations_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/reviews_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/general_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/program_tab_page.dart';
import 'package:tfinder_app/widgets/chewie.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
              buildSliverAppBarForProfilePage(_size, _pageController),
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
                ProfileReviewTab(),
                ProfileProgramTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBarForProfilePage(
      Size _size, PageController pageController) {
    _pageController = pageController;
    String _ppUrl =
        "https://fantastikcanavarlar.com/wp-content/uploads/2017/12/severus-snape-650x365.jpg";

    return SliverAppBar(
        backgroundColor: morDefault,
        pinned: false,
        automaticallyImplyLeading: false,
        expandedHeight: 300,
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
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (ix) {
                      setState(() {
                        // TODO
                        // Bütün sayfa set state olduğu için video tekrar yükleniyor. Provider ile çözülecek
                        _currentPageIndex = ix;
                      });
                    },
                    itemBuilder: (ctx, ix) {
                      return ix == 0
                          ? ProfilPageMainInfos(ppUrl: _ppUrl)
                          : ix == 1
                              ? ProfilPageVideo()
                              : ProfilPageLocation();
                    },
                  ),
                  pageDots(_currentPageIndex, context),
                ],
              ),
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
            Tab(text: "Yorumlar"),
            Tab(text: "Program"),
          ],
        ));
  }

  Positioned pageDots(int currentPageIx, BuildContext context) {
    double _pasifBoyut = 10;
    double _aktifBoyut = 15;
    int _currentPageIndex = currentPageIx;
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 47),
          child: _currentPageIndex == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: _aktifBoyut,
                      width: _aktifBoyut,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: _pasifBoyut,
                      width: _pasifBoyut,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: _pasifBoyut,
                      width: _pasifBoyut,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    )
                  ],
                )
              : _currentPageIndex == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: _pasifBoyut,
                          width: _pasifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: _aktifBoyut,
                          width: _aktifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: _pasifBoyut,
                          width: _pasifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: _pasifBoyut,
                          width: _pasifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: _pasifBoyut,
                          width: _pasifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: _aktifBoyut,
                          width: _aktifBoyut,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}

class ProfilPageLocation extends StatefulWidget {
  const ProfilPageLocation({
    Key key,
  }) : super(key: key);

  @override
  _ProfilPageLocationState createState() => _ProfilPageLocationState();
}

class _ProfilPageLocationState extends State<ProfilPageLocation> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
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
                child: MapSample(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilPageVideo extends StatelessWidget {
  const ProfilPageVideo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
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
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilPageMainInfos extends StatelessWidget {
  const ProfilPageMainInfos({
    Key key,
    @required String ppUrl,
  })  : _ppUrl = ppUrl,
        super(key: key);

  final String _ppUrl;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
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
                    margin:
                        EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 5),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Profil",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Container(
                          //decoration: BoxDecoration(border: Border.all()),
                          padding: EdgeInsets.only(bottom: 20),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ))),
          ),
          Expanded(
            flex: 5,
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: CachedNetworkImageProvider(_ppUrl)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Severus Snape",
              style: TextStyle(
                  color: Colors.white, fontSize: 23, fontFamily: "Raleway"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              " Karanlık Sanatlara Karşı Savunma",
              style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Ankara",
              style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
