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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "En iyi Öğretmenler",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextButton(onPressed: () {}, child: Text("Hepsini gör"))
            ],
          ),
          SizedBox(
            height: size.height / 4,
            child: ListView(
              padding: EdgeInsets.only(right: 15),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Material(
                  child: InkWell(
                    child: Container(
                      width: 160.0,
                      color: Colors.red,
                    ),
                    onTap: () {
                      print(" TIKLANDI");
                    },
                  ),
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
