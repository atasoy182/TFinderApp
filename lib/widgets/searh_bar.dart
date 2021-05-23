import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 270,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: widgetBackgroundColor,
            borderRadius: BorderRadius.circular(29.5),
          ),
          child: TextFormField(
            cursorColor: turuncuDefault,
            decoration: InputDecoration(
              hintText: "Ara",
              icon: Icon(
                Icons.search,
                color: turuncuDefault,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.filter_list,
              color: turuncuDefault,
              size: 35,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
