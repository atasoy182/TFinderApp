import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/diger_tab.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/genel_tab.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/program_tab.dart';
import 'package:tfinder_app/viewmodel/profile_edit_view_model.dart';

import '../model/tf_user_model.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  var dictForSave = {};
  var resimEklenecek = false;
  var videoEklenecek = false;
  File fileResim;
  File fileVideo;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _profileEditModel = Provider.of<ProfileEditViewModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Boşta ise tıklanabilir yoksa tıklanmasın
            if (_profileEditModel.state == ViewState.Idle) {
              if (dictForSave.keys.length > 0 || resimEklenecek || videoEklenecek) {
                var msg = "";
                if (resimEklenecek && fileResim != null) {
                  try {
                    var indirmeLinki = await _profileEditModel.uploadFile("profil_foto", fileResim);
                    if (indirmeLinki != null) {
                      saveDict({TFC.profilFotoURL: indirmeLinki});
                    }
                  } catch (e) {
                    msg = "Resim Kaydedilemedi.";
                  }
                }

                if (videoEklenecek && fileVideo != null) {
                  try {
                    var indirmeLinki = await _profileEditModel.uploadFile("profil_video", fileVideo);
                    if (indirmeLinki != null) {
                      saveDict({TFC.videoURL: indirmeLinki});
                    }
                  } catch (e) {
                    msg = "Video Kaydedilemedi.";
                  }
                }

                var myMap = dictForSave.map((key, value) => MapEntry(key.toString(), value));
                var res = await _profileEditModel.updateUserToDB("", myMap);
                if (res) {
                  dictForSave.clear();
                  resimEklenecek = false;
                  videoEklenecek = false;
                  fileVideo = null;
                  fileResim = null;
                  // var message = MotionToast.success(
                  //     title: "Başarılı !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Başarıyla Kaydedildi !");
                  // scaffoldKey.currentState.showBottomSheet((context) => message);
                } else {
                  var message =
                      MotionToast.error(title: "Hata !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Kaydedilemedi !");
                  scaffoldKey.currentState.showBottomSheet((context) => message);
                }
                //await Future.delayed(Duration(seconds: 1));
                Navigator.pop(context, res ? true : false);
              } else {
                var message =
                    MotionToast.info(title: "Veri yok !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Kaydedilecek veri yok!");
                scaffoldKey.currentState.showBottomSheet((context) => message);
              }
            }
          },
          backgroundColor: defaultLink,
          elevation: 1,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 35,
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Profil Düzenle",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Genel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Diğer",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Program",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              dictForSave.clear();
              Navigator.pop(context, false);
            },
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
          ),
          backwardsCompatibility: false,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
        ),
        body: _profileEditModel.state == ViewState.Busy
            ? Center(
                child: Container(
                  color: semiTransparent,
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballRotateChase,
                          color: defaultLink.withOpacity(0.4),
                        ),
                      ),
                      Expanded(flex: 4, child: Text("Veriler Kaydediliyor")),
                    ],
                  ),
                ),
              )
            : TabBarView(
                children: [
                  ProfileEditGenelTab(
                    callback: (myDict) => saveDict(myDict),
                    callbackFoto: (islem, veri) async {
                      if (islem == "resimekle") {
                        resimEklenecek = true;
                        fileResim = veri;
                      } else {
                        resimEklenecek = false;
                        fileResim = null;
                        saveDict({TFC.profilFotoURL: veri});
                      }
                    },
                  ),
                  ProfileEditDigerTab(
                    callback: (myDict) => saveDict(myDict),
                    callbackVideo: (islem, veri) {
                      if (islem == "videoekle") {
                        fileVideo = veri;
                        videoEklenecek = true;
                      } else {
                        saveDict({TFC.videoURL: ""});
                      }
                    },
                  ),
                  ProfileEditProgramTab(
                    callback: (myDict) => saveDict(myDict),
                  ),
                ],
              ),
      ),
    );
  }

  saveDict(myDict) {
    dictForSave.addAll(myDict);
    print("dictForSave:" + dictForSave.toString());
  }

  // Widget buildUploadStatus() => StreamBuilder<TaskSnapshot>(
  //       stream: task.snapshotEvents,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           print("getir veriler :" + snapshot.data.totalBytes.toString());
  //           print("getir veriler :" + snapshot.data.bytesTransferred.toString());
  //
  //           final snap = snapshot.data;
  //           final progress = snap.bytesTransferred / snap.totalBytes;
  //           final percentage = (progress * 100).toStringAsFixed(2);
  //
  //           return Text(
  //             '$percentage %',
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //           );
  //         } else {
  //           return Container();
  //         }
  //       },
  //     );
}
