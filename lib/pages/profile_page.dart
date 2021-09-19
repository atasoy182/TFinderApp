import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/pages/locations_page.dart';
import 'package:tfinder_app/pages/login_page.dart';
import 'package:tfinder_app/pages/profile_edit_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/reviews_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/general_tab_page.dart';
import 'package:tfinder_app/pages/profile_page_tabs/program_tab_page.dart';
import 'package:tfinder_app/viewmodel/profile_edit_view_model.dart';
import 'package:tfinder_app/viewmodel/tf_user_view_model.dart';
import 'package:tfinder_app/widgets/chewie.dart';
import 'package:tfinder_app/widgets/fab_menu.dart';

enum ProfilePageMode { Degistir, Incele }

class ProfilePage extends StatefulWidget {
  final ProfilePageMode pageMode;

  const ProfilePage({Key key, @required this.pageMode}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageController _pageController = PageController(initialPage: 0);
  var loading = false;

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
    final _profileEditModel = Provider.of<ProfileEditViewModel>(context, listen: false);
    var _size = MediaQuery.of(context).size;
    return !loading
        ? DefaultTabController(
            length: 3,
            child: Scaffold(
                body: Stack(
                  children: [
                    NestedScrollView(
                      headerSliverBuilder: (context, value) {
                        return [
                          buildSliverAppBarForProfilePage(_size, _pageController),
                        ];
                      },
                      body: buildBodyForProfilePage(),
                    ),
                    widget.pageMode == ProfilePageMode.Degistir
                        ? Positioned(
                            left: 15,
                            bottom: 16,
                            child: FloatingActionButton(
                                heroTag: "Edit",
                                onPressed: () async {
                                  var kaydedildi;
                                  var res = await _profileEditModel.doldurBilgiler();
                                  setState(() {
                                    loading = true;
                                  });
                                  try {
                                    if (res) {
                                      kaydedildi = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return ProfileEditPage();
                                      }));
                                    }
                                  } catch (e) {} finally {
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                },
                                child: const ImageIcon(
                                  AssetImage("assets/images/pen.png"),
                                  color: Colors.white,
                                ),
                                backgroundColor: Theme.of(context).primaryColor),
                          )
                        : Container(),
                  ],
                ),
                floatingActionButton: FutureBuilder<TfUser>(
                    future: getirGosterilecekKullanici(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ExampleExpandableFab(
                          tabIndex: 3,
                          tfuser: snapshot.data,
                        );
                      } else {
                        return Container();
                      }
                    })),
          )
        : CircularProgressIndicator();
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
                FutureBuilder<TfUser>(
                    future: getirGosterilecekKullanici(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ProfileGeneralTab(
                          tfUser: snapshot.data,
                        );
                      } else {
                        return Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotateChase,
                                  color: turkuazDefault.withOpacity(0.4),
                                )));
                      }
                    }),
                ProfileReviewTab(),
                FutureBuilder<TfUser>(
                    future: getirGosterilecekKullanici(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ProfileProgramTab(
                          tfUser: snapshot.data,
                        );
                      } else {
                        return Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballRotateChase,
                                  color: turkuazDefault.withOpacity(0.4),
                                )));
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBarForProfilePage(Size _size, PageController pageController) {
    _pageController = pageController;

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
                child: FutureBuilder<TfUser>(
                  future: getirGosterilecekKullanici(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: morDefault,
                            child: Stack(
                              children: [
                                ProfilPageMainInfos(
                                  tfUser: snapshot.data,
                                ),
                                Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.bottomCenter, child: Container(margin: EdgeInsets.only(bottom: 35), child: gifWidget())),
                                ),
                              ],
                            ),
                          ),
                          ProfilPageVideo(
                            key: UniqueKey(),
                            tfUser: snapshot.data,
                          )
                        ],
                      );
                    }
                    return Container(
                      height: 220,
                      width: _size.width,
                      color: morDefault,
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballRotateChase,
                            color: turkuazDefault.withOpacity(0.4),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 15),
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
}

class gifWidget extends StatefulWidget {
  const gifWidget({
    Key key,
  }) : super(key: key);

  @override
  _gifWidgetState createState() => _gifWidgetState();
}

class _gifWidgetState extends State<gifWidget> {
  var visible = true;

  Future<bool> visibleAyarla() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    visibleAyarla().then((value) {
      if (mounted) {
        setState(() {
          visible = false;
        });
      }
    });

    return visible
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Video için sola kaydırınız!",
                maxLines: 4,
                style: TextStyle(color: Colors.white),
              ),
              Image.asset(
                "assets/gifs/dragleft.gif",
                height: 30.0,
                width: 30.0,
              ),
            ],
          )
        : Container();
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
  final TfUser tfUser;

  const ProfilPageVideo({Key key, @required this.tfUser}) : super(key: key);

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
                  fromUrl: true,
                  videoUrl: tfUser.videoURL,
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
  final TfUser tfUser;

  const ProfilPageMainInfos({Key key, @required this.tfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tfUserModel = Provider.of<TfUserViewModel>(context, listen: false);

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
              child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 5),
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
                        height: 50,
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 32,
                          ),
                          onSelected: (String result) async {
                            switch (result) {
                              // case 'edit':
                              //   print('option 1 clicked');
                              //   break;
                              case 'exit':
                                // TODO drop down ile editleme,mesaj atma,tel numarası görme, alanları yapılabilir.
                                MotionToast.info(title: "Çıkış !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Çıkış Yapılıyor")
                                    .show(context);
                                await Future.delayed(Duration(seconds: 1));
                                var sonuc = await _tfUserModel.signOut();
                                if (sonuc) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                      ModalRoute.withName("/login"));
                                }
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            // const PopupMenuItem<String>(
                            //   value: 'edit',
                            //   child: Text('Düzenle'),
                            // ),
                            const PopupMenuItem<String>(
                              value: 'exit',
                              child: Text('Çıkış yap'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
        Expanded(
          flex: 5,
          child: CircleAvatar(radius: 50, backgroundColor: Colors.white, backgroundImage: CachedNetworkImageProvider(tfUser.profilFotoURL)),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 2,
          child: Text(
            tfUser.adSoyad,
            style: TextStyle(color: Colors.white, fontSize: 23, fontFamily: "Raleway"),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            tfUser.oneCikarilanAlan[0],
            style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            tfUser.il + "/" + tfUser.ilce,
            style: TextStyle(color: Colors.white, fontFamily: "Raleway"),
          ),
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }
}

Future<TfUser> getirGosterilecekKullanici(BuildContext context) async {
  final _tfUserModel = Provider.of<TfUserViewModel>(context, listen: false);
  return await _tfUserModel.getCurrentUserWithoutState();
}
