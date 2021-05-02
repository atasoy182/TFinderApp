import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function btnCliked;

  const DefaultButton({Key key, this.btnText, this.btnCliked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(turkuazDefault)),
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
