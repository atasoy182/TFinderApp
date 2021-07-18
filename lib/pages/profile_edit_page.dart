import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/diger_tab.dart';
import 'package:tfinder_app/pages/profile_edit_page_tabs/genel_tab.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String _profileUrl;
  String _videoUrl;

  @override
  Widget build(BuildContext context) {
    final _formProfilePhotoUrl = GlobalKey<FormState>();
    final _formVideoUrl = GlobalKey<FormState>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Kaydet cliked");
          },
          backgroundColor: defaultLink,
          elevation: 1,
          child: IconButton(
            onPressed: () {},
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
            ProfileEditGenelTab(),
            ProfileEditDigerTab(),
            Text("3"),
          ],
        ),
      ),
    );
  }
}
