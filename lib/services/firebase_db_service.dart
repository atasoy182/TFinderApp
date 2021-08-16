import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/database_base.dart';

class DBFirebaseService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) async {
    Map _eklenecekMap = tfUser.toMap();
    _eklenecekMap.addAll(extraPrms);
    await _firestore.collection("users").doc(tfUser.userID).set(_eklenecekMap);
    return true;
  }

  @override
  Future<bool> eMailVarMi(String email) async {
    var users = await _firestore.collection("users").where(TFC.email, isEqualTo: email).limit(1).get();
    if (users.docs.length >= 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> kullaniciVarMi(String userID) async {
    var users = await _firestore.collection("users").where(TFC.userID, isEqualTo: userID).limit(1).get();
    if (users.docs.length >= 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<TfUser> getCurrentTfUserDetayli(String userID) async {
    var users = await _firestore.collection("users").where(TFC.userID, isEqualTo: userID).limit(1).get();
    if (users.docs.length >= 1) {
      return userFromFireBase(users.docs[0]);
    } else {
      return null;
    }
  }

  @override
  Future<TfUser> getCurrentTfUser() {
    // TODO: implement getCurrentTfUser
    throw UnimplementedError();
  }

  userFromFireBase(QueryDocumentSnapshot snapshot) {
    return TfUser.full(
      userID: snapshot.get(TFC.userID),
      email: snapshot.get(TFC.email),
      adSoyad: snapshot.get(TFC.adSoyad),
      profilFotoURL: snapshot.get(TFC.profilFotoURL),
      videoURL: snapshot.get(TFC.videoURL),
      createdAt: snapshot.get(TFC.createdAt).toDate(),
      updatedAt: snapshot.get(TFC.updatedAt).toDate(),
      seviye: snapshot.get(TFC.seviye),
      oneCikarilanAlan: snapshot.get(TFC.oneCikarilanAlan),
      il: snapshot.get(TFC.il),
      ilce: snapshot.get(TFC.ilce),
      dersVerdigiAlanlar: snapshot.get(TFC.dersVerdigiAlanlar),
      dersUcretAraligi: snapshot.get(TFC.dersUcretAraligi),
      yas: snapshot.get(TFC.yas),
      hakkinda: snapshot.get(TFC.hakkinda),
      egitimler: snapshot.get(TFC.egitimler),
      deneyimler: snapshot.get(TFC.deneyimler),
      locationX: snapshot.get(TFC.locationX),
      locationY: snapshot.get(TFC.locationY),
      cepTel: snapshot.get(TFC.cepTel),
      cepTelOnay: snapshot.get(TFC.cepTelOnay),
      onaylanmisOgretmen: snapshot.get(TFC.onaylanmisOgretmen),
      sosyalMedya: snapshot.get(TFC.sosyalMedya),
    );
  }
}
