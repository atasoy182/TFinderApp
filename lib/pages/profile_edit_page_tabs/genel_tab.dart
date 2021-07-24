import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/look_up.dart';

class ProfileEditGenelTab extends StatefulWidget {
  const ProfileEditGenelTab({Key key}) : super(key: key);

  @override
  _ProfileEditGenelTabState createState() => _ProfileEditGenelTabState();
}

class _ProfileEditGenelTabState extends State<ProfileEditGenelTab> {
  String _ppUrl =
      "https://fantastikcanavarlar.com/wp-content/uploads/2017/12/severus-snape-650x365.jpg";

  String _adSoyad;
  String _oneCikarilanAlan = "Bos";
  String _sehir = "Ankara";
  String _ilce = "Çankaya";

  final _formAdsoyadKey = GlobalKey<FormState>();
  final _formOneCikarilanAlanKey = GlobalKey<FormState>();
  final _formKonumKey = GlobalKey<FormState>();

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
            child: Row(
              children: [
                Expanded(flex: 3, child: Text("Öne çıkarılan alan")),
                Expanded(
                  flex: 7,
                  child: Lookup(
                    btnColor: defaultLink,
                    iconColor: defaultLink,
                    lookupMode: LookupMode.SingleSelect,
                    allItems: allCategories,
                    dialogTitle: "Kategori Seçiniz",
                    baslangicDegerleri: ["Bilgisayar"],
                    hintText:
                        "İngilizce, Python, Gitar, Psikoloji, TYT, Gölge Öğretmen aratabilirsiniz",
                    okCliked: (secilenler) {
                      print("Secilenler:" + secilenler.toString());
                    },
                  ),
                  /*
                  DropdownButton(
                    isExpanded: true,
                    value: _oneCikarilanAlan,
                    onChanged: (String newValue) {
                      setState(() {
                        _oneCikarilanAlan = newValue;
                      });
                    },
                    items: <String>[
                      'ASDAEDFEWDEWDWEDWEDWEDWEDWEDEWFDEWF',
                      'Two',
                      'Free',
                      'Four',
                      'Bos'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  */
                )
              ],
            ),
          ),
        ),
        // Ders Verilen Alanlar
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //color: Colors.green,
            height: 60,
            child: Row(
              children: [
                Expanded(flex: 3, child: Text("Ders verilen alanlar")),
                Expanded(
                  flex: 7,
                  child: Lookup(
                    btnColor: defaultLink,
                    iconColor: defaultLink,
                    lookupMode: LookupMode.MultiSelect,
                    allItems: allCategories,
                    dialogTitle: "Kategori Seçiniz",
                    baslangicDegerleri: ["Bilgisayar", "İngilizce"],
                    hintText:
                        "İngilizce, Python, Gitar, Psikoloji, TYT, Gölge Öğretmen aratabilirsiniz",
                    okCliked: (secilenler) {
                      print("Secilenler:" + secilenler.toString());
                    },
                  ),
                  /*
                  DropdownButton(
                    isExpanded: true,
                    value: _oneCikarilanAlan,
                    onChanged: (String newValue) {
                      setState(() {
                        _oneCikarilanAlan = newValue;
                      });
                    },
                    items: <String>[
                      'ASDAEDFEWDEWDWEDWEDWEDWEDWEDEWFDEWF',
                      'Two',
                      'Free',
                      'Four',
                      'Bos'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  */
                )
              ],
            ),
          ),
        ),
        // Şehir
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //color: Colors.green,
            height: 60,
            child: Row(
              children: [
                Expanded(flex: 3, child: Text("Şehir")),
                Expanded(
                  flex: 7,
                  child: DropdownButton(
                    key: UniqueKey(),
                    isExpanded: true,
                    value: _sehir,
                    onChanged: (String newValue) {
                      setState(() {
                        _ilce = "Seçim Yapınız";
                        _sehir = newValue;
                      });
                    },
                    items: allStatesOfTurkey
                        .map((item) => buildDropdownMenuItem(item))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
        // İlçe
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //color: Colors.green,
            height: 60,
            child: Row(
              children: [
                Expanded(flex: 3, child: Text("İlçe")),
                Expanded(
                  flex: 7,
                  child: DropdownButton(
                    key: UniqueKey(),
                    isExpanded: true,
                    value: _ilce,
                    onChanged: (String newValue) {
                      setState(() {
                        _ilce = newValue;
                      });
                    },
                    items: _buildIlceItemsForDropDown(),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIlceItemsForDropDown() {
    List<String> ilceler = [];
    var tempIlceler = [];
    String _sehirID = '0';

    if (_sehir != "Seçim Yapınız") {
      for (var i = 0; i < allStatesOfTurkey.length; i++) {
        // Sehirin idsini bulalım.
        if (allStatesOfTurkey[i]['aciklama'] == _sehir) {
          _sehirID = allStatesOfTurkey[i]['kodu'].toString();
        }
      }

      tempIlceler =
          allCitiesOfTurkey.where((f) => f['il'] == _sehirID).toList();

      tempIlceler.forEach((element) {
        if (!ilceler.contains("Seçim Yapınız")) {
          ilceler.add("Seçim Yapınız");
        }
        ilceler.add(element["aciklama"]);
      });
    } else {
      ilceler.add("Seçim Yapınız");
    }

    return ilceler.map<DropdownMenuItem<String>>((String deg) {
      return DropdownMenuItem<String>(
        key: UniqueKey(),
        value: deg,
        child: Text(deg),
      );
    }).toList();
  }

  DropdownMenuItem<String> buildDropdownMenuItem(dynamic item) {
    return DropdownMenuItem(
      key: UniqueKey(),
      value: item['aciklama'],
      child: Text(item['aciklama'] ?? ""),
    );
  }
}
