import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/chewie.dart';
import 'package:tfinder_app/widgets/education_experince_widget.dart';

class ProfileEditDigerTab extends StatefulWidget {
  const ProfileEditDigerTab({Key key}) : super(key: key);

  @override
  _ProfileEditDigerTabState createState() => _ProfileEditDigerTabState();
}

class _ProfileEditDigerTabState extends State<ProfileEditDigerTab> {
  String hakkinda = "";
  List egitimler = [
    {
      "yil": "2021",
      "okul": "İstanbul Arel Üniversitesi",
      "bolum": "Bilgisayar Mühendisliği",
      "derece": "Lisans",
    },
    {
      "yil": "2021",
      "okul": "İstanbul Arel Üniversitesi",
      "bolum": "Bilgisayar Mühendisliği",
      "derece": "Lisans",
    }
  ];
  List deneyimler = [
    {"yil": "2021", "isyeri": "Dia yazılım", "alan": "Yazılım Geliştirici"},
    {"yil": "2021", "isyeri": "Dia yazılım", "alan": "Yazılım Geliştirici"}
  ];

  final _formHakkindaKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Video değiştir
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 7,
                  child: ChewieVideoPlayer(
                    videoUrl:
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading:
                                        Icon(Icons.link, color: defaultLink),
                                    title: new Text('URL linkinden getir'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading:
                                        Icon(Icons.photo, color: defaultLink),
                                    title: new Text('Galeriden Video Seç'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading:
                                        Icon(Icons.camera, color: defaultLink),
                                    title: new Text('Kameradan Video Çek'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.highlight_remove,
                                        color: defaultLink),
                                    title: new Text('Tanıtım Videosu Kaldır'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Tanıtım Videosunu Değiştir',
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
        // Hakkında
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Text(
              "Hakkında",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Raleway"),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            child: Form(
              key: _formHakkindaKey,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLength: null,
                maxLines: 7,
                onSaved: (String input) => hakkinda = input,
                decoration: InputDecoration(
                  icon: ImageIcon(
                    AssetImage("assets/images/about.png"),
                    size: 32,
                    color: defaultLink,
                  ),
                  labelText: 'Hakkında',
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
        SliverToBoxAdapter(
          child: Divider(),
        ),
        // Eğitim
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Text(
              "Eğitim",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Raleway"),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    egitimler[index]['yil'],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        egitimler[index]['okul'] ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        egitimler[index]['bolum'] ?? "",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        egitimler[index]['derece'] ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: EducationExperince(
                    edExMode: EdExMode.IconButton,
                    icon: Icons.edit,
                    operation: 0,
                    values: egitimler[index],
                    kaydetCliked: (kaydedilecekDeger) {
                      egitimler[index] = kaydedilecekDeger;
                      setState(() {});
                    },
                    silCliked: (silinecekDeger) {
                      egitimler.removeAt(index);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          );
        }, childCount: egitimler.length)),
        SliverToBoxAdapter(
          child: EducationExperince(
            edExMode: EdExMode.TextButton,
            textButtonText: "Eğitim Ekle",
            operation: 0,
            kaydetCliked: (kaydedilecekDeger) {
              egitimler.add(kaydedilecekDeger);
              setState(() {});
            },
            silCliked: (silinecekDeger) {},
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(),
        ),
        // İş Deneyimi
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Text(
              "Deneyim",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Raleway"),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    deneyimler[index]['yil'],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(deneyimler[index]['isyeri'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        deneyimler[index]['alan'],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                EducationExperince(
                  edExMode: EdExMode.IconButton,
                  icon: Icons.edit,
                  operation: 1,
                  values: deneyimler[index],
                  kaydetCliked: (kaydedilecekDeger) {
                    deneyimler[index] = kaydedilecekDeger;
                    setState(() {});
                  },
                  silCliked: (silinecekDeger) {
                    deneyimler.removeAt(index);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        }, childCount: deneyimler.length)),
        SliverToBoxAdapter(
          child: EducationExperince(
            edExMode: EdExMode.TextButton,
            textButtonText: "Deneyim Ekle",
            operation: 1,
            kaydetCliked: (kaydedilecekDeger) {
              print("kaydedilecekDeger: " + kaydedilecekDeger.toString());

              deneyimler.add(kaydedilecekDeger);
              setState(() {});
            },
            silCliked: (silinecekDeger) {},
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(),
        ),

        // Scroll için boşluk
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        ),
      ],
    );
  }
}
