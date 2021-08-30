import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralTabCard extends StatelessWidget {
  final String longString;
  final String baslikText;
  final String assetIconPath;

  const GeneralTabCard({Key key, this.longString, this.assetIconPath, this.baslikText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //margin: EdgeInsets.only(bottom: 30),
                child: ImageIcon(
                  AssetImage(assetIconPath),
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        baslikText,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Raleway"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandText(
                      longString,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class GeneralEducationTabCard extends StatelessWidget {
  final String baslikText;
  final String assetIconPath;
  final List gosterilecekListe;

  const GeneralEducationTabCard({Key key, this.baslikText, this.assetIconPath, this.gosterilecekListe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              //margin: EdgeInsets.only(top: 30),
              child: ImageIcon(
                AssetImage(assetIconPath),
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: buildBody(gosterilecekListe),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget buildBody(list) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            baslikText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Raleway"),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        list.asMap().containsKey(0) ? buildRow(list[0], baslikText) : Container(),
        list.asMap().containsKey(0) ? Divider() : Container(),
        list.asMap().containsKey(1) ? buildRow(list[1], baslikText) : Container(),
        list.asMap().containsKey(1) ? Divider() : Container(),
        list.length > 2 ? ExpandRowWidget(list, baslikText) : Container(),
      ],
    );
  }

  Widget ExpandRowWidget(list, baslikText) {
    var myList = [...list];
    myList.removeAt(0);
    myList.removeAt(0);
    return ExpandChild(
      child: Column(
        children: myList.map((value) {
          return Column(
            children: [
              buildRow(value, baslikText),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget buildRow(value, baslikText) {
    var egitimMi = baslikText == "Eğitim" ? true : false;

    if (!egitimMi) {
      print("value:" + value.toString());
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            egitimMi ? value['yil'] ?? "" : value['yil'] ?? "",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Text(
                egitimMi ? value['okul'] ?? "" : value['isyeri'] ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(egitimMi ? value['bolum'] ?? "" : value['alan'] ?? "", textAlign: TextAlign.center),
              egitimMi
                  ? SizedBox(
                      height: 5,
                    )
                  : Container(),
              egitimMi ? Text(value['derece'] ?? "", textAlign: TextAlign.center) : Container()
            ],
          ),
        )
      ],
    );
  }
}

class GeneralTabChips extends StatelessWidget {
  final List<String> chipList;
  final String assetIconPath;

  const GeneralTabChips({Key key, this.chipList, this.assetIconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: chipList.map((item) => _buildChip(item, context)).toList(),
      ),
    );
  }

  Widget _buildChip(String label, BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
