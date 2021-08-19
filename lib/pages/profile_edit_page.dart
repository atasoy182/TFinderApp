import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/diger_tab.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/genel_tab.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/program_tab.dart';
import 'package:tfinder_app/viewmodel/profile_edit_view_model.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  var dictForSave = {};
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _profileEditModel = Provider.of<ProfileEditViewModel>(context, listen: false);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          backgroundColor: defaultLink,
          elevation: 1,
          child: IconButton(
            onPressed: () async {
              print(" FLOATİNG ACTİON BUTTONA TIKLANDI!!!");
              print("dictForSave:" + dictForSave.toString());
              print("dictForSave:" + dictForSave.runtimeType.toString());
              var myMap = dictForSave.map((key, value) => MapEntry(key.toString(), value));
              var res = await _profileEditModel.updateUserToDB("", myMap);
              if (res) {
                var message = MotionToast.success(
                    title: "Başarılı !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Başarıyla Kaydedildi !");
                scaffoldKey.currentState.showBottomSheet((context) => message);
              } else {
                var message = MotionToast.error(title: "Hata !", titleStyle: TextStyle(fontWeight: FontWeight.bold), description: "Kaydedilemedi !");
                scaffoldKey.currentState.showBottomSheet((context) => message);
              }
            },
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.check,
              color: Colors.white,
              size: 35,
            ),
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
              Navigator.pop(context);
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
        body: TabBarView(
          children: [
            ProfileEditGenelTab(
              callback: (myDict) => saveDict(myDict),
            ),
            ProfileEditDigerTab(
              callback: (myDict) => saveDict(myDict),
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
}
