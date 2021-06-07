import 'package:flutter/material.dart';

//const kBackgroundColor = Color(0xFFF8F8F8);
//const kActiveIconColor = Color(0xFFE68342);
//const kTextColor = Color(0xFF222B45);
//const kBlueLightColor = Color(0xFFC7B8F5);
//const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
const turuncuDefault = Color.fromRGBO(250, 151, 93, 1);
const pictureBgColor = Color.fromRGBO(48, 45, 44, 1);
const sariDefault = Color.fromRGBO(253, 196, 37, 1);
final golgeDefault = Color(0xFFD3D3D3).withOpacity(.84);

const topViewColor = Color(0xFFF5CEB8);
const widgetBackgroundColor = Color.fromRGBO(240, 240, 240, 1);
const textDisabledColor = Color.fromRGBO(126, 126, 126, 1);
const turkuazRenk = Color.fromRGBO(65, 202, 198, 1);
final kBoxShadowColor = Color(0xFFD3D3D3).withOpacity(.84);
const profilRenk = Color.fromRGBO(158, 146, 134, 1);

const yesilDefault = Color.fromRGBO(116, 184, 22, 1);
const yesil1 = Color.fromRGBO(192, 235, 117, 1);
const yesil2 = Color.fromRGBO(148, 216, 45, 1);
const yesil3 = Color.fromRGBO(130, 201, 30, 1);
const yesil4 = Color.fromRGBO(116, 184, 22, 1);
const yesil5 = Color.fromRGBO(102, 168, 15, 1);
const yesil6 = Color.fromRGBO(92, 148, 13, 1);

const turkuazDefault = Color.fromRGBO(65, 202, 198, 1);
const turkuazWithOpacity = Color.fromRGBO(65, 202, 198, 0.8);
const turkuazWithOpacity2 = Color.fromRGBO(65, 202, 198, 0.6);
const turkuazWithOpacity3 = Color.fromRGBO(65, 202, 198, 0.4);
const turkuazWithOpacity4 = Color.fromRGBO(65, 202, 198, 0.2);

const morDefault = Color.fromRGBO(82, 67, 101, 1);

const MaterialColor turkuazMaterialColor = const MaterialColor(
  0xFF41CAC6,
  const <int, Color>{
    50: Color.fromRGBO(65, 202, 198, .1),
    100: Color.fromRGBO(65, 202, 198, .2),
    200: Color.fromRGBO(65, 202, 198, .3),
    300: Color.fromRGBO(65, 202, 198, .4),
    400: Color.fromRGBO(65, 202, 198, .5),
    500: Color.fromRGBO(65, 202, 198, .6),
    600: Color.fromRGBO(65, 202, 198, .7),
    700: Color.fromRGBO(65, 202, 198, .8),
    800: Color.fromRGBO(65, 202, 198, .9),
    900: Color.fromRGBO(65, 202, 198, 1),
  },
);

const MaterialColor morMaterialColor = const MaterialColor(
  0xFF524365,
  const <int, Color>{
    50: Color.fromRGBO(82, 67, 101, .1),
    100: Color.fromRGBO(82, 67, 101, .2),
    200: Color.fromRGBO(82, 67, 101, .3),
    300: Color.fromRGBO(82, 67, 101, .4),
    400: Color.fromRGBO(82, 67, 101, .5),
    500: Color.fromRGBO(82, 67, 101, .6),
    600: Color.fromRGBO(82, 67, 101, .7),
    700: Color.fromRGBO(82, 67, 101, .8),
    800: Color.fromRGBO(82, 67, 101, .9),
    900: Color.fromRGBO(82, 67, 101, 1),
  },
);

const defaultTurkuazGradient =
    const LinearGradient(begin: Alignment.topCenter, colors: [
  Color.fromRGBO(65, 202, 198, 1),
  Color.fromRGBO(65, 202, 198, 0.8),
  Color.fromRGBO(65, 202, 198, 0.6),
]);

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
