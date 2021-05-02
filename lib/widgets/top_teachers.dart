import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

Widget TopTeacherHeader(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "En iyi Öğretmenler",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(onPressed: () {}, child: Text("Hepsini gör"))
      ],
    ),
  );
}

class TopTeachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        TopTeacherHeader(context),
        SizedBox(
          height: size.height / 4.2,
          child: ListView(
            padding: EdgeInsets.only(right: 10),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TopTeachersItem(
                teacherName:
                    "AhmetXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                teacherSurname: "Sabancı",
                teacherDepartment: "İngilizce",
                teacherProfileImg: "assets/images/top_teacher_1.jpg",
              ),
              TopTeachersItem(
                teacherName: "Mehmet",
                teacherSurname: "Atasoy",
                teacherDepartment: "Programlama",
                teacherProfileImg: "assets/images/top_teacher_2.png",
              ),
              TopTeachersItem(
                teacherName: "Ayşe",
                teacherSurname: "Koç",
                teacherDepartment: "Matematik",
                teacherProfileImg: "assets/images/top_teacher_3.jpg",
              ),
              TopTeachersItem(
                teacherName: "Leyla",
                teacherSurname: "Tekin",
                teacherDepartment: "Psikolog",
                teacherProfileImg: "assets/images/top_teacher_4.jpg",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TopTeachersItem extends StatelessWidget {
  final String teacherName;
  final String teacherSurname;
  final String teacherDepartment;
  final String teacherProfileImg;

  const TopTeachersItem(
      {Key key,
      this.teacherName,
      this.teacherSurname,
      this.teacherDepartment,
      this.teacherProfileImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        height: size.height / 4,
        width: size.width / 2.5,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 33,
                        color: kShadowColor,
                      )
                    ]),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Image.asset(
                  teacherProfileImg,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: turkuazDefault,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      teacherName + " " + teacherSurname,
                      style:
                          TextStyle(fontFamily: "Raleway", color: Colors.white),
                      maxLines: 1,
                    ),
                    Text(
                      teacherDepartment,
                      style:
                          TextStyle(fontFamily: "Raleway", color: Colors.white),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    print("Top Teacher Item Cliked");
                  },
                  child: Container(
                    width: size.width / 2.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
