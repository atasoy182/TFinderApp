import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

Widget TopTeacherHeader(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Önerilen Öğretmenler",
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
    return Container(
      height: 230,
      //color: Colors.grey,
      child: Column(
        children: [
          TopTeacherHeader(context),
          TopTeacherCard(),
        ],
      ),
    );
  }

  Widget TopTeacherCard() {
    return SizedBox(
      height: 175,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3.5 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          TopTeacherCardItem(
            teacherName: "Berkay",
            teacherSurname: "Atasoy",
            teacherDepartment: "Programlama",
            teacherProfileImg:
                "https://pixomatic.us/blog/wp-content/uploads/2019/11/pixomatic_1572877223091.png",
          ),
          TopTeacherCardItem(
            teacherName: "Ayşe",
            teacherSurname: "Tekin",
            teacherDepartment: "İngilizce",
            teacherProfileImg:
                "https://i.pinimg.com/originals/a6/0d/68/a60d685194a7fd984d08a595a0a99ae7.jpg",
          ),
          TopTeacherCardItem(
            teacherName: "Fatma",
            teacherSurname: "Çalışkan",
            teacherDepartment: "Matematik",
            teacherProfileImg:
                "https://www.retratosbarcelona.com/wp-content/uploads/2019/11/maggie-1-of-1-200x300.jpg",
          ),
          TopTeacherCardItem(
            teacherName: "Abdullah",
            teacherSurname: "Uçan",
            teacherDepartment: "Fizik",
            teacherProfileImg:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTvAJ9W2cgHigEFfs35tI2RY3ie6Of6QQ8EeW6WjKQlVd-5UZZLEfoMZIadm-WaU8k3o&usqp=CAU",
          ),
          TopTeacherCardItem(
            teacherName: "Necla",
            teacherSurname: "Tuncer",
            teacherDepartment: "Biyoloji",
            teacherProfileImg:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcjkg8OgZDk14js0Sr93nemR--qEdYkUC9zw&usqp=CAU",
          ),
        ],
      ),
    );
  }
}

class TopTeacherCardItem extends StatelessWidget {
  final String teacherName;
  final String teacherSurname;
  final String teacherDepartment;
  final String teacherProfileImg;

  const TopTeacherCardItem(
      {Key key,
      this.teacherName = "",
      this.teacherSurname = "",
      this.teacherDepartment = "",
      this.teacherProfileImg = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(teacherProfileImg),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            teacherName + " " + teacherSurname[0] + ".",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
                color: Colors.black,
                fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            teacherDepartment,
            style: TextStyle(
                fontSize: 15, fontFamily: "Raleway", color: Colors.grey),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
