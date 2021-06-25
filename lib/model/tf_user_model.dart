import 'package:flutter/material.dart';

class TfUser {
  final String userID;
  String email;
  String profilFotoURL;
  String videoURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;
  String oneCikarilanAlan;
  String il;
  List dersVerdigiAlanlar;
  String dersUcretAraligi;
  String ad;
  String soyAd;
  int yas;
  String hakkinda;
  List egitimler;
  List deneyimler;
  String locationX;
  String locationY;
  String cepTel;
  List sosyalMedya;

  TfUser({@required this.userID});
}
