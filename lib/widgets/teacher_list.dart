import 'package:flutter/material.dart';

class TeacherList extends StatelessWidget {
  final List<TeacherListItem> teachers = <TeacherListItem>[
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
    TeacherListItem(
        "https://cdn.pixabay.com/photo/2020/12/09/16/08/joker-5817831__340.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: 600,
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: teachers.length,
        itemBuilder: (BuildContext context, int index) {
          return teachers[index];
        },
      ),
    );
  }
}

class TeacherListItem extends StatelessWidget {
  final String profilUrl;

  const TeacherListItem(this.profilUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://classguilt.files.wordpress.com/2016/08/suit.jpg")),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Hello world")],
          ),
        ],
      ),
    );
  }
}
