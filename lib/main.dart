import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: morMaterialColor,
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
