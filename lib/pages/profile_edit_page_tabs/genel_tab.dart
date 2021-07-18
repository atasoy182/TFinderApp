import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class ProfileEditGenelTab extends StatefulWidget {
  const ProfileEditGenelTab({Key key}) : super(key: key);

  @override
  _ProfileEditGenelTabState createState() => _ProfileEditGenelTabState();
}

class _ProfileEditGenelTabState extends State<ProfileEditGenelTab> {
  String _ppUrl =
      "https://fantastikcanavarlar.com/wp-content/uploads/2017/12/severus-snape-650x365.jpg";

  String _adSoyad;
  String _oneCikarilanAlan;

  final _formAdsoyadKey = GlobalKey<FormState>();
  final _formOneCikarilanAlanKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Profil resmini değiştir
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(_ppUrl)),
                ),
                Expanded(
                    flex: 4,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: new Text('Galeriden Resim Seç'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: new Text('Kameradan Resim Seç'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.highlight_remove),
                                    title: new Text('Profil Resmini Kaldır'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Profil Resmini Değiştir',
                        style: TextStyle(color: defaultLink, fontSize: 18),
                      ),
                    ))
              ],
            ),
          ),
        ),
        // Ad Soyad
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //color: Colors.green,
            height: 60,
            child: Form(
              key: _formAdsoyadKey,
              child: TextFormField(
                onSaved: (String adSoyadInput) => _adSoyad = adSoyadInput,
                decoration: InputDecoration(
                  labelText: 'Ad Soyad',
                  // border: OutlineInputBorder(),
                  // contentPadding: EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        // One Çıkarılan Alan
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //color: Colors.green,
            height: 60,
            child: Form(
              child: TextFormField(
                key: _formOneCikarilanAlanKey,
                onSaved: (String oneCikarilanAlan) =>
                    _oneCikarilanAlan = oneCikarilanAlan,
                decoration: InputDecoration(
                  labelText: 'Öne Çıkarılan Alan',
                  // border: OutlineInputBorder(),
                  // contentPadding: EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
