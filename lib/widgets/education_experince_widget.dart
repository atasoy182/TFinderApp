import 'package:flutter/material.dart';
import 'package:tfinder_app/widgets/look_up.dart';

import '../constants.dart';
import 'dynamicLookUp.dart';

enum EdExMode { TextButton, IconButton }

class EducationExperince extends StatefulWidget {
  final String textButtonText;
  final IconData icon;
  final EdExMode edExMode;

  const EducationExperince(
      {Key key, this.textButtonText = "", this.icon, @required this.edExMode})
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

  iconOrTextCliked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return EducationExperincePage();
      }),
    );
  }
}

class EducationExperincePage extends StatefulWidget {
  const EducationExperincePage({Key key}) : super(key: key);

  @override
  _EducationExperincePageState createState() => _EducationExperincePageState();
}

class _EducationExperincePageState extends State<EducationExperincePage> {
  var seciliYil = "Seçim Yapınız";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
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
        title: Text(
          "Ekle/Düzenle",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
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
                        value: seciliYil,
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
                      selectedItem: "Hacettepe Üniversitesi",
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  DropdownMenuItem<String> buildDropdownMenuItem(String item) {
    return DropdownMenuItem(
      key: UniqueKey(),
      value: item,
      child: Text(item ?? ""),
    );
  }
}
