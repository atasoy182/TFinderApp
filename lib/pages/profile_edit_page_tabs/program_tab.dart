import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/base_button.dart';

class ProfileEditProgramTab extends StatefulWidget {
  final List secimler;

  const ProfileEditProgramTab({Key key, this.secimler}) : super(key: key);

  @override
  _ProfileEditProgramTabState createState() => _ProfileEditProgramTabState();
}

class _ProfileEditProgramTabState extends State<ProfileEditProgramTab> {
  Map<String, dynamic> secimler;

  @override
  void initState() {
    super.initState();
    secimler = {
      "0": ["08.00", "09.00", "10.00", "11.00"],
      "1": ["13.00", "14.00"],
      "2": ["13.00", "14.00"],
      "3": ["13.00", "14.00"],
      "4": ["13.00", "14.00"],
      "5": ["13.00", "14.00"],
      "6": ["13.00", "14.00"],
    };
    // add all düşünülebilir.
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: haftaninGunleri.length,
      itemBuilder: (context, haftaIndex) {
        return _renderRow(haftaIndex);
      },
    );
  }

  Widget _renderRow(int haftaIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          //height: 50,
          width: double.infinity,
          //color: Colors.green,
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            haftaninGunleri[haftaIndex],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: "Raleway"),
          ),
        ),
        Container(
            width: double.infinity,
            //height: 150,
            child: _renderSaatler(haftaIndex)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: DefaultButton(
                  btnText: "Sabah - Öğlen Seç",
                  btnCliked: () {
                    secimler[haftaIndex.toString()] = [
                      "07.00",
                      "08.00",
                      "09.00",
                      "10.00",
                      "11.00",
                      "12.00",
                    ];
                    setState(() {});
                  },
                  btnColor: turuncuDefault,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: DefaultButton(
                  btnText: "Öğlen - Akşam Seç",
                  btnCliked: () {
                    secimler[haftaIndex.toString()] = [
                      "12.00",
                      "13.00",
                      "14.00",
                      "15.00",
                      "16.00",
                      "17.00",
                      "18.00"
                    ];
                    setState(() {});
                  },
                  btnColor: defaultLink,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: DefaultButton(
                  btnText: "Akşam - Gece Seç",
                  btnCliked: () {
                    secimler[haftaIndex.toString()] = [
                      "18.00",
                      "19.00",
                      "20.00",
                      "21.00",
                      "22.00",
                      "23.00",
                      "00.00"
                    ];
                    setState(() {});
                  },
                  btnColor: morDefault,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: Container(),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: DefaultButton(
                  btnText: "Tümünü kaldır",
                  btnCliked: () {
                    secimler[haftaIndex.toString()] = [];
                    setState(() {});
                  },
                  btnColor: dangerDefault,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: DefaultButton(
                  btnText: "Tümünü seç",
                  btnCliked: () {
                    secimler[haftaIndex.toString()] = saatList;
                    setState(() {});
                  },
                  btnColor: successDefault,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }

  Widget _renderSaatler(int haftaIndex) {
    return Wrap(
      children: saatList.map((element) {
        bool secimKontrol() {
          var myList = secimler.keys.toList();

          if (myList.contains(haftaIndex.toString())) {
            if (secimler[haftaIndex.toString()].contains(element)) {
              return true;
            }
          }

          return false;
        }

        var seciliMi = secimKontrol();

        return TextButton(
          onPressed: () {
            var oldList = secimler[haftaIndex.toString()];

            if (!oldList.contains(element)) {
              var newList = oldList;
              newList.add(element);
              secimler[haftaIndex.toString()] = newList;
            } else {
              var newList = oldList;
              newList.remove(element);
              secimler[haftaIndex.toString()] = newList;
            }
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: seciliMi ? Colors.green : Colors.transparent,
            ),
            child: Text(
              element,
              style: TextStyle(
                  color: seciliMi ? Colors.white : defaultLink, fontSize: 20),
            ),
          ),
        );
      }).toList(),
    );
  }
}
