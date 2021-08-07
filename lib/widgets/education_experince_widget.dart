import 'package:flutter/material.dart';
import 'package:tfinder_app/widgets/base_button.dart';
import 'package:tfinder_app/widgets/look_up.dart';

import '../constants.dart';
import 'dynamicLookUp.dart';

enum EdExMode { TextButton, IconButton }

class EducationExperince extends StatefulWidget {
  final String textButtonText;
  final IconData icon;
  final EdExMode edExMode;
  final int operation;
  final Function kaydetCliked;
  final Function silCliked;
  final Map<String, dynamic> values;

  const EducationExperince(
      {Key key,
      this.textButtonText = "",
      this.icon,
      @required this.edExMode,
      @required this.operation,
      @required this.kaydetCliked,
      @required this.silCliked,
      this.values = const {}})
      : super(key: key);

  @override
  _EducationExperinceState createState() => _EducationExperinceState();
}

class _EducationExperinceState extends State<EducationExperince> {
  @override
  Widget build(BuildContext context) {
    return widget.edExMode == EdExMode.IconButton
        ? IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              widget.icon,
              color: defaultLink,
              size: 30,
            ),
            onPressed: () => iconOrTextCliked(),
          )
        : TextButton(
            onPressed: () => iconOrTextCliked(),
            child: Text(
              widget.textButtonText,
              style: TextStyle(color: defaultLink, fontSize: 18),
            ),
          );
  }

  iconOrTextCliked() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        bool controlField(String field) {
          if (widget.values.keys.toList().contains(field))
            return true;
          else
            return false;
        }

        return EducationExperincePage(
          edExMode: widget.edExMode,
          operation: widget.operation,
          seciliYil:
              controlField("yil") ? widget.values["yil"] : "Seçim Yapınız",
          seciliOkul: controlField("okul") ? widget.values["okul"] : "",
          seciliBolum: controlField("bolum") ? widget.values["bolum"] : "",
          derece: controlField("derece")
              ? widget.values["derece"]
              : "Seçim Yapınız",
          isyeri: controlField("isyeri") ? widget.values["isyeri"] : "",
          alan: controlField("alan") ? widget.values["alan"] : "",
        );
      }),
    );

    if (result != null) {
      if (result[0] == "save") {
        widget.kaydetCliked(result[1]);
      } else if (result[0] == "delete") {
        widget.silCliked(result[1]);
      }
    }

    //print("Result:" + result);
  }
}

class EducationExperincePage extends StatefulWidget {
  final EdExMode edExMode;
  final int operation;
  final String seciliYil;
  final String seciliBolum;
  final String seciliOkul;
  final String derece;
  final String isyeri;
  final String alan;

  const EducationExperincePage(
      {Key key,
      this.edExMode,
      this.operation,
      this.seciliYil = "Seçim Yapınız",
      this.seciliBolum = "",
      this.derece = "Seçim Yapınız",
      this.seciliOkul = "",
      this.isyeri = "",
      this.alan = ""})
      : super(key: key);

  @override
  _EducationExperincePageState createState() => _EducationExperincePageState();
}

class _EducationExperincePageState extends State<EducationExperincePage> {
  String seciliYil;

  // Education için
  String seciliOkul;
  String seciliBolum;
  String derece;

  // Experince için
  String isyeri;
  String alan;

  final _formIsyeriKey = GlobalKey<FormState>();
  final _formAlanKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    seciliYil = widget.seciliYil;
    seciliOkul = widget.seciliOkul;
    seciliBolum = widget.seciliBolum;
    derece = widget.derece;
    isyeri = widget.isyeri;
    alan = widget.alan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, [""]);
          },
          padding: EdgeInsets.all(0),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: Text(
          "Ekle/Düzenle",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return widget.operation == 0
        ? Container(
            width: double.infinity,
            height: double.infinity,
            //color: Colors.green,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        child: Text(
                          "Yil",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton(
                          isExpanded: true,
                          value: seciliYil ?? "Seçim Yapınız",
                          onChanged: (String newValue) {
                            setState(() {
                              seciliYil = newValue;
                            });
                          },
                          items: yearList
                              .map((item) => buildDropdownMenuItem(item))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Okul",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 6,
                      child: DynamicLookUp(
                        btnColor: defaultLink,
                        dialogTitle: "Üniversite Seçiniz",
                        iconColor: defaultLink,
                        hintText:
                            "University of Cambridge, Hacettepe Üniversitesi gibi arama yapabilirsiniz ! ",
                        extraList: allUniversitiesOfTurkey,
                        apiURL: "http://universities.hipolabs.com/search?name=",
                        selectedItem: seciliOkul ?? "Seçim Yapınız",
                        okCliked: (selectedItem) => {seciliOkul = selectedItem},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Bölüm",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 6,
                        child: Lookup(
                          btnColor: defaultLink,
                          lookupMode: LookupMode.SingleSelect,
                          allItems: allDepartments,
                          baslangicDegerleri: [seciliBolum ?? "Seçim Yapınız"],
                          iconColor: defaultLink,
                          hintText:
                              "Bilgisayar Mühendisliği, İngilizce Öğretmenliği gibi aratabilisiniz !",
                          okCliked: (selectedItems) {
                            seciliBolum = selectedItems[0];
                          },
                          dialogTitle: "Bölüm Seçiniz",
                        ))
                  ],
                ),
                widget.operation == 0
                    ? SizedBox(
                        height: 15,
                      )
                    : Container(),
                widget.operation == 0
                    ? Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Align(
                              child: Text(
                                "Derece",
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            flex: 6,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: DropdownButton(
                                isExpanded: true,
                                value: derece ?? "Seçim Yapınız",
                                onChanged: (String newValue) {
                                  setState(() {
                                    derece = newValue;
                                  });
                                },
                                items: allDegrees
                                    .map((item) => buildDropdownMenuItem(item))
                                    .toList(),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    widget.edExMode == EdExMode.IconButton
                        ? Expanded(
                            flex: 5,
                            child: DefaultButton(
                              btnText: "Sil",
                              btnCliked: () {
                                var gonderilecekDegerler;
                                if (widget.operation == 0) {
                                  gonderilecekDegerler = {
                                    "yil": seciliYil ?? "",
                                    "okul": seciliOkul ?? "",
                                    "bolum": seciliBolum ?? "",
                                    "derece": derece ?? "",
                                  };
                                }

                                Navigator.pop(
                                    context, ["delete", gonderilecekDegerler]);
                              },
                              btnColor: dangerDefault,
                            ),
                          )
                        : Expanded(flex: 5, child: Container()),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 5,
                      child: DefaultButton(
                        btnText: "Kaydet",
                        btnCliked: () {
                          var gonderilecekDegerler;
                          if (widget.operation == 0) {
                            gonderilecekDegerler = {
                              "yil": seciliYil ?? "",
                              "okul": seciliOkul ?? "",
                              "bolum": seciliBolum ?? "",
                              "derece": derece ?? "",
                            };
                          }

                          Navigator.pop(
                              context, ["save", gonderilecekDegerler]);
                        },
                        btnColor: successDefault,
                      ),
                    ),
                  ],
                )
              ],
            ))
        : Container(
            width: double.infinity,
            height: double.infinity,
            //color: Colors.green,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        child: Text(
                          "Yil",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton(
                          isExpanded: true,
                          value: seciliYil ?? "Seçim Yapınız",
                          onChanged: (String newValue) {
                            setState(() {
                              seciliYil = newValue;
                            });
                          },
                          items: yearList
                              .map((item) => buildDropdownMenuItem(item))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //  işyeri

                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formIsyeriKey,
                        child: TextFormField(
                          initialValue: isyeri,
                          onSaved: (input) => isyeri = input,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.person, color: defaultLink),
                            labelText: 'Çalışılan kurum',
                            // border: OutlineInputBorder(),
                            // contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                // çalışılan alan

                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formAlanKey,
                        child: TextFormField(
                          initialValue: alan,
                          onSaved: (input) => alan = input,
                          decoration: InputDecoration(
                            //icon: Icon(Icons.person, color: defaultLink),
                            labelText: 'Çalışılan Pozisyon',
                            // border: OutlineInputBorder(),
                            // contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey, width: 1.0),
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    widget.edExMode == EdExMode.IconButton
                        ? Expanded(
                            flex: 5,
                            child: DefaultButton(
                              btnText: "Sil",
                              btnCliked: () {
                                var gonderilecekDegerler;
                                if (widget.operation == 1) {
                                  _formAlanKey.currentState.save();
                                  _formIsyeriKey.currentState.save();

                                  gonderilecekDegerler = {
                                    "yil": seciliYil ?? "",
                                    "isyeri": isyeri ?? "",
                                    "alan": alan ?? ""
                                  };
                                }

                                Navigator.pop(
                                    context, ["delete", gonderilecekDegerler]);
                              },
                              btnColor: dangerDefault,
                            ),
                          )
                        : Expanded(flex: 5, child: Container()),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 5,
                      child: DefaultButton(
                        btnText: "Kaydet",
                        btnCliked: () {
                          var gonderilecekDegerler;
                          if (widget.operation == 1) {
                            _formAlanKey.currentState.save();
                            _formIsyeriKey.currentState.save();
                            gonderilecekDegerler = {
                              "yil": seciliYil ?? "",
                              "isyeri": isyeri ?? "",
                              "alan": alan ?? ""
                            };
                          }
                          Navigator.pop(
                              context, ["save", gonderilecekDegerler]);
                        },
                        btnColor: successDefault,
                      ),
                    ),
                  ],
                )
              ],
            ));
  }

  DropdownMenuItem<String> buildDropdownMenuItem(String item) {
    //print("İTEM : " + item.toString());

    return DropdownMenuItem(
      key: UniqueKey(),
      value: item,
      child: Text(
        item ?? "",
        textAlign: TextAlign.center,
      ),
    );
  }
}
