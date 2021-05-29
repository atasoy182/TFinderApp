import 'package:expand_widget/expand_widget.dart';
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
    return Card(
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
                    alignment: Alignment.topLeft,
                    child: Text(
                      baslikText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ExpandText(
                    longString,
                    maxLines: 4,
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
}
