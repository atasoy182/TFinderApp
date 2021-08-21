import 'dart:io';

import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';
import 'package:tfinder_app/services/firebase_storage_service.dart';
import 'package:tfinder_app/services/sqflite_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class TfUserRepository implements AuthBase {
  AuthFirebaseService _firebaseAuthService = locator.get<AuthFirebaseService>();
  DBFirebaseService _firebaseDBService = locator.get<DBFirebaseService>();
  FirebaseStorageService _firebaseStorageService = locator.get<FirebaseStorageService>();
  DBSQFLiteService _sqfLiteDBService = locator.get<DBSQFLiteService>();
  AppMode _appMode = AppMode.RELEASE;
  TfUser girisYapilanKullanici;
  TfUser detayliGirisYapilanKullanici;
  String currentUserID;

  @override
  Future<TfUser> getCurrentUser() async {
    if (_appMode == AppMode.RELEASE) {
      girisYapilanKullanici = await _firebaseAuthService.getCurrentUser();
      currentUserID = girisYapilanKullanici.userID;
      detayliGirisYapilanKullanici = await getCurrentTfUserDetayli(girisYapilanKullanici.userID);
      return detayliGirisYapilanKullanici;
    }
    return null;
  }

  @override
  Future<TfUser> signInAnonymously() async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signInAnonymously();
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signOut();
    }
    return null;
  }

  @override
  Future<TfUser> signInWithGoogle() async {
    if (_appMode == AppMode.RELEASE) {
      var girisYapilanTfUser = await _firebaseAuthService.signInWithGoogle();
      girisYapilanKullanici = girisYapilanTfUser;

      bool _kayitVarMi = await _firebaseDBService.kullaniciVarMi(girisYapilanTfUser.userID);
      bool _resultFromDB = true;
      if (!_kayitVarMi) {
        _resultFromDB = await _firebaseDBService.saveUserToDB(girisYapilanTfUser, {});
      }

      if (_resultFromDB || _kayitVarMi)
        return girisYapilanTfUser;
      else
        return null;
    }
    return null;
  }

  @override
  Future<TfUser> createTfUserWithEmail(String email, String password, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      TfUser _tfuser = await _firebaseAuthService.createTfUserWithEmail(email, password, extraPrms);
      girisYapilanKullanici = _tfuser;
      bool _resultFromDB = await _firebaseDBService.saveUserToDB(_tfuser, extraPrms);
      if (_resultFromDB)
        return _tfuser;
      else
        return null;
    }
    return null;
  }

  @override
  Future<TfUser> signInWithEmail(String email, String password) async {
    if (_appMode == AppMode.RELEASE) {
      return girisYapilanKullanici = await _firebaseAuthService.signInWithEmail(email, password);
    }
    return null;
  }

  Future<bool> forgotPassword(String email) async {
    if (_appMode == AppMode.RELEASE) {
      bool _resultFromDB = await _firebaseDBService.eMailVarMi(email);
      if (_resultFromDB) {
        girisYapilanKullanici = null;
        return await _firebaseAuthService.forgotPassword(email);
      } else
        return false;
    }
  }

  Future<bool> eMailVarMi(String email) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.eMailVarMi(email);
    }
    return null;
  }

  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.saveUserToDB(tfUser, extraPrms);
    }
    return null;
  }

  Future<TfUser> getCurrentTfUserDetayli(String userID) async {
    if (_appMode == AppMode.RELEASE) {
      if (detayliGirisYapilanKullanici != null) {
        return detayliGirisYapilanKullanici;
      } else {
        return await _firebaseDBService.getCurrentTfUserDetayli(userID);
      }
    }
    return null;
  }

  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      var myMap = detayliGirisYapilanKullanici.toMap();
      var res = await _firebaseDBService.updateUserToDB(currentUserID, extraPrms);
      if (res) {
        myMap.addAll(extraPrms);
        detayliGirisYapilanKullanici = TfUser.fromMap(myMap);
      }
      return res;
    }
    return null;
  }

  Future<String> uploadFile(String fileType, File yeniImage) async {
    var _indirmeLinki = await _firebaseStorageService.uploadFile(currentUserID, fileType, yeniImage);
    return _indirmeLinki;
  }
}
