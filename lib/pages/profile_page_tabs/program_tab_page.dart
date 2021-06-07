import 'package:flutter/material.dart';
import 'package:tfinder_app/widgets/icon_button.dart';

class ProfileProgramTab extends StatefulWidget {
  @override
  _ProfileProgramTabState createState() => _ProfileProgramTabState();
}

class _ProfileProgramTabState extends State<ProfileProgramTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 50,
            margin: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Row(
              children: [
                IconButtonWithBorder(
                  iconData: Icons.arrow_back_ios,
                  onPressed: () {},
                  useBorder: false,
                  padding: EdgeInsets.only(left: 10),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButtonWithBorder(
                  iconData: Icons.arrow_forward_ios,
                  useBorder: false,
                  onPressed: () {},
                ),
                Spacer(),
                Text(
                  "7-13 Haz 2021",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                IconButtonWithBorder(
                  iconData: Icons.calendar_today_rounded,
                  useBorder: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
