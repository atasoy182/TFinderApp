import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/viewmodel/profile_edit_view_model.dart';
import 'package:tfinder_app/widgets/look_up.dart';
import 'dart:io';

class ProfileEditGenelTab extends StatefulWidget {
  const ProfileEditGenelTab({Key key}) : super(key: key);

  @override
  _ProfileEditGenelTabState createState() => _ProfileEditGenelTabState();
}

class _ProfileEditGenelTabState extends State<ProfileEditGenelTab> with AutomaticKeepAliveClientMixin {
  String _ppUrl = "https://fantastikcanavarlar.com/wp-content/uploads/2017/12/severus-snape-650x365.jpg";

  String _adSoyad = "Mehmet Berkay Atasoy";
  String _email = "atasoy182@gmail.com";
  String _ceptel = "+90 (555) 555-55-55";
  String _sehir = "Ankara";
  String _ilce = "Çankaya";
  String _ucretAraligi = "50-100";
  String _ucretAraligi1;
  String _ucretAraligi2;
  String _yas = "24";

  File _pickedImage;
  int operation = 0;

  final _formAdsoyadKey = GlobalKey<FormState>();
  final _formCepTelKey = GlobalKey<FormState>();
  final _formEmailKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  MaskInputFormatter phoneFormatter = MaskInputFormatter(mask: '+## (###) ###-##-##');

  @override
  void initState() {
    super.initState();
    _ucretAraligi1 = _ucretAraligi.split("-")[0];
    _ucretAraligi2 = _ucretAraligi.split("-")[1];
  }

  @override
  Widget build(BuildContext context) {
    final _profileEditModel = Provider.of<ProfileEditViewModel>(context);

    return _profileEditModel.state == ViewState.Busy
        ? Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                color: turkuazDefault.withOpacity(0.4),
              ),
            ),
          )
        : CustomScrollView(
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
                          radius: 55,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                              radius: 43,
                              backgroundColor: Colors.white,
                              backgroundImage: _pickedImage == null ? CachedNetworkImageProvider(_ppUrl) : FileImage(_pickedImage)),
                        ),
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
                                          leading: Icon(
                                            Icons.photo,
                                            color: defaultLink,
                                          ),
                                          title: new Text('Galeriden Resim Seç'),
                                          onTap: () {
                                            _loadPicker(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera, color: defaultLink),
                                          title: new Text('Kameradan Resim Çek'),
                                          onTap: () {
                                            _loadPicker(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.highlight_remove, color: defaultLink),
                                          title: new Text('Profil Resmini Kaldır'),
                                          onTap: () {
                                            setState(() {
                                              _pickedImage = null;
                                              _ppUrl = "https://img.icons8.com/pastel-glyph/2x/person-male--v2.png";
                                            });
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

              SliverToBoxAdapter(
                child: Divider(),
              ),

              // Ad Soyad
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Form(
                    key: _formAdsoyadKey,
                    child: TextFormField(
                      initialValue: _profileEditModel.extraPrms.containsKey('adsoyad') ? _profileEditModel.extraPrms['adsoyad'] : "",
                      onSaved: (String adSoyadInput) => _adSoyad = adSoyadInput,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person, color: defaultLink),
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
              // Ceptel
              // TODO ceptel onaylama yapılacak.. Numaram görünsün mü ? yapılacak
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Form(
                    key: _formCepTelKey,
                    child: TextFormField(
                      initialValue: _ceptel,
                      inputFormatters: [phoneFormatter],
                      keyboardType: TextInputType.phone,
                      onSaved: (String input) => _ceptel = input,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone, color: defaultLink),
                        labelText: 'Cep Telefon',
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
              //Email
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Form(
                    key: _formEmailKey,
                    child: TextFormField(
                      initialValue: _email,
                      onSaved: (String input) => _email = input,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail, color: defaultLink),
                        labelText: 'E mail',
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
              // Yaş
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text("Yaş")),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: _yas,
                          onSaved: (String input) => _yas = input,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(),
                      ),
                    ],
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
                          hintText: "İngilizce, Python, Gitar, Psikoloji, TYT, Gölge Öğretmen aratabilirsiniz",
                          okCliked: (secilenler) {
                            print("Secilenler:" + secilenler.toString());
                          },
                        ),
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
                          hintText: "İngilizce, Python, Gitar, Psikoloji, TYT, Gölge Öğretmen aratabilirsiniz",
                          okCliked: (secilenler) {
                            print("Secilenler:" + secilenler.toString());
                          },
                        ),
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
                          items: allStatesOfTurkey.map((item) => buildDropdownMenuItem(item)).toList(),
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
              // Ders Ücret Aralığı
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text("Ders ücret aralığı")),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          initialValue: _ucretAraligi1,
                          onSaved: (String input) => _ucretAraligi1 = input,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(child: Text("ile")),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          initialValue: _ucretAraligi2,
                          keyboardType: TextInputType.number,
                          onSaved: (String input) => _ucretAraligi2 = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Divider(),
              ),

              // Konum Değiştir
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  //color: Colors.green,
                  height: 60,
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Konum Değiştir',
                        style: TextStyle(color: defaultLink, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Divider(),
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

      tempIlceler = allCitiesOfTurkey.where((f) => f['il'] == _sehirID).toList();

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

  void _loadPicker(ImageSource imageSource) async {
    final XFile picked = await _picker.pickImage(source: imageSource);

    if (picked != null) {
      File cropped = await ImageCropper.cropImage(
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: "Resim Kırp",
          toolbarWidgetColor: Colors.black,
        ),
        sourcePath: picked.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        maxWidth: 800,
      );
      if (cropped != null) {
        setState(() {
          _pickedImage = cropped;
        });
      }
    } else {
      setState(() {
        _pickedImage = null;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
