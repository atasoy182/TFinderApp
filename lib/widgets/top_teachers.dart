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
                  teacherDepartment: "İngilizce",
                  teacherPrice: "100 - 150 tl",
                  teacherProfileImg: "assets/images/top_teacher_1.jpg",
                ),
                TopTeachersItem(
                  teacherName: "Mehmet",
                  teacherDepartment: "Programlama",
                  teacherPrice: "100 - 150 tl",
                  teacherProfileImg: "assets/images/top_teacher_2.png",
                ),
                TopTeachersItem(
                  teacherName: "Ayşe",
                  teacherDepartment: "Matematik",
                  teacherPrice: "100 - 150 tl",
                  teacherProfileImg: "assets/images/top_teacher_3.jpg",
                ),
                TopTeachersItem(
                  teacherName: "Leyla",
                  teacherDepartment: "Psikoloji",
                  teacherPrice: "100 - 150 tl",
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
  final String teacherDepartment;
  final String teacherPrice;
  final String teacherProfileImg;

  const TopTeachersItem({
    Key key,
    this.teacherName,
    this.teacherDepartment,
    this.teacherPrice,
    this.teacherProfileImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        // Dıştaki row sağdan boşluk vermek için
        children: [
          Stack(
            children: [
              Container(
                width: size.width / 2.5,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(width: 0.5),
                  color: topViewColor,
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
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  teacherName,
                                  style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                child: Text(
                                  teacherDepartment,
                                  style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                child: Text(
                                  teacherPrice,
                                  style: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.white),
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
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
