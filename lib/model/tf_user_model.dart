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

  @override
  String toString() {
    return 'TfUser{userID: $userID, email: $email, profilFotoURL: $profilFotoURL, videoURL: $videoURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye, oneCikarilanAlan: $oneCikarilanAlan, il: $il, dersVerdigiAlanlar: $dersVerdigiAlanlar, dersUcretAraligi: $dersUcretAraligi, ad: $ad, soyAd: $soyAd, yas: $yas, hakkinda: $hakkinda, egitimler: $egitimler, deneyimler: $deneyimler, locationX: $locationX, locationY: $locationY, cepTel: $cepTel, sosyalMedya: $sosyalMedya}';
  }
}
