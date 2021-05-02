import 'package:flutter/material.dart';

class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: 500,
      padding: EdgeInsets.only(top: 10),
      child: ListView(
        children: [
          TeacherListItem(
              profilUrl:
                  "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
        ],
      ),
    );
  }
}

class TeacherListItem extends StatelessWidget {
  final String profilUrl;

  const TeacherListItem({Key key, this.profilUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Image.network(
                profilUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
