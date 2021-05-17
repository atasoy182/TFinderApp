import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'file:///D:/Flutter_uygulamalari/gitApps/tfinder_app/lib/pages/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: turkuazMaterialColor,
        fontFamily: "Raleway",
        textTheme: TextTheme(
          headline6: TextStyle(fontFamily: 'Raleway'),
          headline4: TextStyle(fontFamily: 'Raleway', color: Colors.black),
          headline3: TextStyle(fontFamily: 'Raleway', color: Colors.black),
          bodyText1: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
      home: StartPage(),
    );
  }
}
