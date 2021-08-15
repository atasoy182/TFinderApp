import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/widgets/icon_button.dart';
import 'package:tfinder_app/constants.dart';

class ProfileProgramTab extends StatefulWidget {
  @override
  _ProfileProgramTabState createState() => _ProfileProgramTabState();
}

class _ProfileProgramTabState extends State<ProfileProgramTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 50,
        //     margin: EdgeInsets.only(left: 8, right: 8, top: 8),
        //     child: Row(
        //       children: [
        //         IconButtonWithBorder(
        //           iconData: Icons.arrow_back_ios,
        //           onPressed: () {},
        //           useBorder: false,
        //           padding: EdgeInsets.only(left: 10),
        //         ),
        //         IconButtonWithBorder(
        //           iconData: Icons.arrow_forward_ios,
        //           useBorder: false,
        //           onPressed: () {},
        //         ),
        //         Spacer(),
        //         Text(
        //           "7-13 Haz 2021",
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //         ),
        //         Spacer(),
        //         IconButtonWithBorder(
        //           iconData: Icons.calendar_today_rounded,
        //           useBorder: false,
        //           onPressed: () {},
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: Divider(
        //     thickness: 2,
        //   ),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ProgramRow(),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              );
            },
            childCount: 7, // 1000 list items
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProgramRow extends StatelessWidget {
  const ProgramRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              //color: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "7",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "P.tesi",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "08.00",
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "08.00",
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "08.00",
                        style: TextStyle(color: linkColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                ExpandChild(
                  child: Container(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 0,
                      runSpacing: 0,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "08.00",
                            style: TextStyle(color: linkColor, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
