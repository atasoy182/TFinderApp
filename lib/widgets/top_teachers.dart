import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class TopTeachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 12.0, top: 17, right: 12.0),
      child: Column(
        children: [
          TopTeacherHeader(context),
          SizedBox(
            height: size.height / 4.2,
            child: ListView(
              padding: EdgeInsets.only(right: 15),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TopTeachersItem(
                  teacherName: "Ahmet",
                  teacherSurname: "Sabancı",
                  teacherDepartment: "İngilizce",
                  teacherProfileImg: "assets/images/top_teacher_1.jpg",
                ),
                TopTeachersItem(
                  teacherName: "Mehmet",
                  teacherSurname: "Koç",
                  teacherDepartment: "Programlama",
                  teacherProfileImg: "assets/images/top_teacher_2.png",
                ),
                TopTeachersItem(
                  teacherName: "Ayşe",
                  teacherSurname: "Yılmaz",
                  teacherDepartment: "Matematik",
                  teacherProfileImg: "assets/images/top_teacher_3.jpg",
                ),
                TopTeachersItem(
                  teacherName: "Leyla",
                  teacherDepartment: "Psikoloji",
                  teacherSurname: "Akrep",
                  teacherProfileImg: "assets/images/top_teacher_4.jpg",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row TopTeacherHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "En iyi Öğretmenler",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(onPressed: () {}, child: Text("Hepsini gör"))
      ],
    );
  }
}

class TopTeachersItem extends StatelessWidget {
  final String teacherName;
  final String teacherSurname;
  final String teacherDepartment;
  final String teacherProfileImg;

  const TopTeachersItem({
    Key key,
    this.teacherName,
    this.teacherDepartment,
    this.teacherSurname,
    this.teacherProfileImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: size.width / 2.5,
              //padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(width: 0.5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 33,
                      color: kShadowColor,
                    )
                  ]
                  //image: DecorationImage(image: AssetImage(teacherProfileImg)),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          teacherProfileImg,
                          width: size.width / 2.5,
                          height: size.height / 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              child: Text(
                                teacherName + " " + teacherSurname,
                                style: TextStyle(
                                    fontFamily: "Raleway", color: Colors.white),
                              ),
                            ),
                            Align(
                              child: Text(
                                teacherDepartment,
                                style: TextStyle(
                                    fontFamily: "Raleway", color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
