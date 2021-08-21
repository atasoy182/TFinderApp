import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// TFUser Firebase yazma sabitleri
class TFC {
  static final String userID = 'userID';
  static final String email = 'email';
  static final String profilFotoURL = 'profilFotoURL';
  static final String videoURL = 'videoURL';
  static final String createdAt = 'createdAt';
  static final String updatedAt = 'updatedAt';
  static final String seviye = 'seviye';
  static final String oneCikarilanAlan = 'oneCikarilanAlan';
  static final String il = 'il';
  static final String ilce = 'ilce';
  static final String dersVerdigiAlanlar = 'dersVerdigiAlanlar';
  static final String dersUcretAraligi = 'dersUcretAraligi';
  static final String adSoyad = 'adSoyad';
  static final String yas = 'yas';
  static final String hakkinda = 'hakkinda';
  static final String egitimler = 'egitimler';
  static final String deneyimler = 'deneyimler';
  static final String locationX = 'locationX';
  static final String locationY = 'locationY';
  static final String cepTel = 'cepTel';
  static final String cepTelOnay = 'cepTelOnay';
  static final String sosyalMedya = 'sosyalMedya';
  static final String onaylanmisOgretmen = 'onaylanmisOgretmen';
  static final String program = 'program';
}

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
  String ilce;
  List dersVerdigiAlanlar;
  String dersUcretAraligi;
  String adSoyad;
  String yas;
  String hakkinda;
  List egitimler;
  List deneyimler;
  String locationX;
  String locationY;
  String cepTel;
  String cepTelOnay;
  String onaylanmisOgretmen;
  List sosyalMedya;
  Map program;

  TfUser({@required this.userID, @required this.email, this.adSoyad});

  TfUser.full({
    @required this.userID,
    @required this.email,
    @required this.adSoyad,
    @required this.profilFotoURL,
    @required this.videoURL,
    @required this.createdAt,
    @required this.updatedAt,
    this.seviye = 0,
    @required this.oneCikarilanAlan,
    @required this.il,
    @required this.ilce,
    @required this.dersVerdigiAlanlar,
    @required this.dersUcretAraligi,
    @required this.yas,
    @required this.hakkinda,
    @required this.egitimler,
    @required this.deneyimler,
    @required this.locationX,
    @required this.locationY,
    @required this.cepTel,
    @required this.cepTelOnay,
    @required this.onaylanmisOgretmen,
    @required this.sosyalMedya,
    @required this.program,
  });

  @override
  String toString() {
    return 'TfUser{userID: $userID, email: $email, profilFotoURL: $profilFotoURL, videoURL: $videoURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye, oneCikarilanAlan: $oneCikarilanAlan, il: $il,  ilce: $ilce, dersVerdigiAlanlar: $dersVerdigiAlanlar, dersUcretAraligi: $dersUcretAraligi, adSoyad: $adSoyad, yas: $yas, hakkinda: $hakkinda, egitimler: $egitimler, deneyimler: $deneyimler, locationX: $locationX, locationY: $locationY, cepTel: $cepTel , cepTelOnay: $cepTelOnay, onaylanmisOgretmen: $onaylanmisOgretmen , sosyalMedya: $sosyalMedya, program: $program}';
  }

  Map<String, dynamic> toMap() {
    return {
      TFC.userID: userID,
      TFC.email: email,
      TFC.profilFotoURL: profilFotoURL ?? '',
      TFC.videoURL: videoURL ?? '',
      TFC.createdAt: createdAt ?? FieldValue.serverTimestamp(),
      TFC.updatedAt: updatedAt ?? FieldValue.serverTimestamp(),
      TFC.seviye: seviye ?? 0,
      TFC.oneCikarilanAlan: oneCikarilanAlan ?? '',
      TFC.il: il ?? '',
      TFC.ilce: ilce ?? '',
      TFC.dersVerdigiAlanlar: dersVerdigiAlanlar ?? [],
      TFC.dersUcretAraligi: dersUcretAraligi ?? '',
      TFC.adSoyad: adSoyad ?? '',
      TFC.yas: yas ?? 0,
      TFC.hakkinda: hakkinda ?? '',
      TFC.egitimler: egitimler ?? [],
      TFC.deneyimler: deneyimler ?? [],
      TFC.locationX: locationX ?? '',
      TFC.locationY: locationY ?? '',
      TFC.cepTel: cepTel ?? '',
      TFC.cepTelOnay: cepTelOnay ?? '',
      TFC.onaylanmisOgretmen: onaylanmisOgretmen ?? '',
      TFC.sosyalMedya: sosyalMedya ?? [],
      TFC.program: program ?? [],
    };
  }

  TfUser.fromMap(Map<String, dynamic> map)
      : userID = map[TFC.userID],
        email = map[TFC.email],
        profilFotoURL = map[TFC.profilFotoURL],
        videoURL = map[TFC.videoURL],
        createdAt = map[TFC.createdAt] is DateTime ? map[TFC.createdAt] : (map[TFC.createdAt] as Timestamp).toDate(),
        updatedAt = map[TFC.updatedAt] is DateTime ? map[TFC.updatedAt] : (map[TFC.updatedAt] as Timestamp).toDate(),
        seviye = map[TFC.seviye],
        oneCikarilanAlan = map[TFC.oneCikarilanAlan],
        il = map[TFC.il],
        ilce = map[TFC.ilce],
        dersVerdigiAlanlar = map[TFC.dersVerdigiAlanlar],
        dersUcretAraligi = map[TFC.dersUcretAraligi],
        adSoyad = map[TFC.adSoyad],
        yas = map[TFC.yas],
        hakkinda = map[TFC.hakkinda],
        egitimler = map[TFC.egitimler],
        deneyimler = map[TFC.deneyimler],
        locationX = map[TFC.locationX],
        locationY = map[TFC.locationY],
        cepTel = map[TFC.cepTel],
        cepTelOnay = map[TFC.cepTelOnay],
        onaylanmisOgretmen = map[TFC.onaylanmisOgretmen],
        sosyalMedya = map[TFC.sosyalMedya],
        program = map[TFC.program];
}
