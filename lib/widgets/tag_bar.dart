import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class TagBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          tagBarItem(
            tagText: "İngilizce",
            isActive: true,
          ),
          tagBarItem(
            tagText: "Matematik",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Almanca",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Programlama",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Fizik",
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class tagBarItem extends StatelessWidget {
  final String tagText;
  final bool isActive;

  const tagBarItem({
    Key key,
    @required this.tagText,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: size.width / 3,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isActive ? turkuazDefault : widgetBackgroundColor,
                ),
                child: Align(
                  child: Text(
                    tagText,
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: isActive ? Colors.white : textDisabledColor),
                  ),
                ),
              ),
              Positioned(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      print("Tag item Cliked");
                    },
                    child: Container(
                      width: size.width / 3,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
