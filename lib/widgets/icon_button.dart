import 'package:flutter/material.dart';

class IconButtonWithBorder extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final bool useBorder;

  const IconButtonWithBorder(
      {Key key,
      this.onPressed,
      this.iconData,
      this.padding = const EdgeInsets.all(0),
      this.useBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: useBorder
            ? Border.all(color: Theme.of(context).primaryColor)
            : null,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: padding,
        icon: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
