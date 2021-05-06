import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function btnCliked;
  final Color btnColor;

  const DefaultButton(
      {Key key, this.btnText, this.btnCliked, this.btnColor = turkuazDefault})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(this.btnColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
      onPressed: btnCliked,
      child: Row(
        children: [
          Spacer(),
          Text(
            btnText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
