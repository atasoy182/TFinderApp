import 'package:flutter/material.dart';

class Yorumlar {
  final String id;
  String userID;
  String yazanKisininAdi;
  String yazanKisininSoyAdi;
  String yorum;
  DateTime createdAt;
  DateTime updatedAt;

  Yorumlar({@required this.id});
}
