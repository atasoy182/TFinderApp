import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class TeacherListItem extends StatelessWidget {
  final int index;

  const TeacherListItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 15, right: 15),
      //decoration: BoxDecoration(border: Border.all()),
      child: Stack(
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.only(left: 55, top: 10, bottom: 10, right: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(left: 75, right: 5, top: 5, bottom: 5),
                child: Container(
                  //color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 22,
                          ),
                          Text(
                            "Cansın Özgör",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 23,
                          ),
                          Text(
                            "Uzman Psikolog",
                            maxLines: 1,
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            //decoration: BoxDecoration(border: Border.all()),
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.menu_book_sharp,
                              color: turuncuDefault,
                              size: 20,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "İngilizce / Almanca / Fransızca",
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            //decoration: BoxDecoration(border: Border.all()),
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.location_on,
                              color: turuncuDefault,
                              size: 20,
                            ),
                          ),
                          Text(
                            "Kadıköy, İstanbul",
                            maxLines: 1,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            margin: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.money,
                              color: turuncuDefault,
                              size: 20,
                            ),
                          ),
                          Text(
                            "100 - 125",
                            maxLines: 1,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          teacherProfilePhoto(),
        ],
      ),
    );
  }

  Widget teacherProfilePhoto() {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              "https://monteluke.com.au/wp-content/gallery/linkedin-profile-pictures/9.JPG")),
    );
  }
}
