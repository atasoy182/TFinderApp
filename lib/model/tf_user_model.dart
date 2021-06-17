import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TfUser {
  final String userID;
  String email;
  String userName;
  String profileURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;

  TfUser({@required this.userID});
}
