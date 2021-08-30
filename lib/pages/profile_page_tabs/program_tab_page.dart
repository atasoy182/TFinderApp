import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/model/tf_user_model.dart';

class ProfileProgramTab extends StatefulWidget {
  final TfUser tfUser;

  const ProfileProgramTab({Key key, @required this.tfUser}) : super(key: key);
  @override
  _ProfileProgramTabState createState() => _ProfileProgramTabState();
}

class _ProfileProgramTabState extends State<ProfileProgramTab> with AutomaticKeepAliveClientMixin {
  Map program;

  @override
  void initState() {
    super.initState();
    program = widget.tfUser.program;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 10),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ProgramRow(
                      values: program[index.toString()],
                      index: index,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              );
            },
            childCount: program.keys.length,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProgramRow extends StatelessWidget {
  final values;
  final index;

  const ProgramRow({
    Key key,
    this.values,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String whichDay = haftaninGunleriKisa[index];

    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    whichDay,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: childrens(index, values),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> childrens(int index, List values) {
    if (values != null) {
      if (values.length <= 3) {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              values.asMap().containsKey(0)
                  ? TextButton(
                      onPressed: () {},
                      child: Text(
                        values[0],
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    )
                  : Container(),
              values.asMap().containsKey(1)
                  ? TextButton(
                      onPressed: () {},
                      child: Text(
                        values[1],
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    )
                  : Container(),
              values.asMap().containsKey(2)
                  ? TextButton(
                      onPressed: () {},
                      child: Text(
                        values[2],
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    )
                  : Container(),
            ],
          ),
        ];
      } else {
        return [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  values[0],
                  style: TextStyle(color: linkColor, fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  values[1],
                  style: TextStyle(color: linkColor, fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  values[2],
                  style: TextStyle(color: linkColor, fontSize: 20),
                ),
              ),
            ],
          ),
          expandChild(index, values),
        ];
      }
    } else {
      return [];
    }
  }

  ExpandChild expandChild(int index, List values) {
    var myList = [...values];
    myList.removeAt(0);
    myList.removeAt(0);
    myList.removeAt(0);
    return ExpandChild(
      child: Container(
        width: double.infinity,
        child: Wrap(
          spacing: 0,
          runSpacing: 0,
          children: myList.map((value) {
            return TextButton(
              onPressed: () {},
              child: Text(
                value,
                style: TextStyle(color: linkColor, fontSize: 20),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
