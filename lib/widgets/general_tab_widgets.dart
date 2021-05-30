import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralTabCard extends StatelessWidget {
  final String longString;
  final String baslikText;
  final String assetIconPath;

  const GeneralTabCard(
      {Key key, this.longString, this.assetIconPath, this.baslikText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
  final String year;
  final String calisilanyerText;
  final String calisilanbolumText;

  const GeneralEducationTabCard(
      {Key key,
      this.baslikText,
      this.assetIconPath,
      this.year,
      this.calisilanyerText,
      this.calisilanbolumText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      baslikText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  buildRow(),
                  Divider(),
                  buildRow(),
                  Divider(),

                  //TODO eğitim 2 den fazla ise expandchild düşünülebilir.
                  ExpandChild(
                    child: Column(
                      children: [
                        buildRow(),
                        Divider(),
                        buildRow(),
                        Divider(),
                      ],
                    ),
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
    );
  }

  Widget buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            year,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Text(calisilanyerText,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(calisilanbolumText),
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

  const GeneralTabChips({Key key, this.chipList, this.assetIconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: <Widget>[
          _buildChip('Python', context),
          _buildChip('Postgresql', context),
          _buildChip('Qt5', context),
          _buildChip('React Native', context),
          _buildChip('Firebase', context),
        ],
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

//class GeneralExperinceTabCard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//        elevation: 4,
//        child: Column(
//          children: [
//            Expanded(
//              flex: 3,
//              child: Text(
//                "Eğitim",
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//              ),
//            ),
//            Expanded(
//              flex: 7,
//              child: Row(
//                children: [
//                  Expanded(
//                    flex: 3,
//                    child: ImageIcon(
//                      AssetImage("assets/images/graduate.png"),
//                      size: 32,
//                      color: Theme.of(context).primaryColor,
//                    ),
//                  ),
//                  Expanded(
//                    flex: 7,
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//                      child: Column(
//                        children: [
//                          Align(
//                            alignment: Alignment.topLeft,
//                            child: Text(
//                              "Eğitim",
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold, fontSize: 20),
//                            ),
//                          ),
//                          SizedBox(
//                            height: 15,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Text(
//                                "2021",
//                                style: TextStyle(fontSize: 20),
//                              ),
//                              Text("İstanbul Arel Üniversitesi")
//                            ],
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Text(
//                                "2021",
//                                style: TextStyle(fontSize: 20),
//                              ),
//                              Text("İstanbul Arel Üniversitesi")
//                            ],
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Text(
//                                "2021",
//                                style: TextStyle(fontSize: 20),
//                              ),
//                              Text("İstanbul Arel Üniversitesi")
//                            ],
//                          ),
//// TODO eğitim 4 ten fazla ise expandchild düşünülebilir.
////                  ExpandChild(
////                    child: Row(
////                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                      children: [
////                        Text(
////                          "2021",
////                          style: TextStyle(fontSize: 20),
////                        ),
////                        Text("İstanbul Arel Üniversitesi")
////                      ],
////                    ),
////                  ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ));
//  }
//}
