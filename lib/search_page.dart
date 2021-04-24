import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SEARCH PAGE"),
            Text(
              "En iyi öğretmenler ile tanışmak artık çok kolay !",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
