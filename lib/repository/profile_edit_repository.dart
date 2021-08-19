import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/tf_user_repository.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';
import 'package:tfinder_app/services/database_base.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';
import 'package:tfinder_app/services/sqflite_db_service.dart';

class ProfileEditRepository implements DBBase {
  AppMode _appMode = AppMode.RELEASE;
  DBFirebaseService _firebaseDBService = locator.get<DBFirebaseService>();
  DBSQFLiteService _sqfLiteDBService = locator.get<DBSQFLiteService>();
  AuthFirebaseService _firebaseAuthService = locator.get<AuthFirebaseService>();
  String currentUserID;

  @override
  Future<bool> eMailVarMi(String email) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.eMailVarMi(email);
    }
    return null;
  }

  @override
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.saveUserToDB(tfUser, extraPrms);
    }
    return null;
  }

  @override
  Future<bool> kullaniciVarMi(String userID) {
    // TODO: implement kullaniciVarMi
    throw UnimplementedError();
  }

  @override
  Future<TfUser> getCurrentTfUserDetayli(String userID) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.getCurrentTfUserDetayli(userID);
    }
    return null;
  }

  @override
  Future<TfUser> getCurrentTfUser() async {
    if (_appMode == AppMode.RELEASE) {
      var res = await _firebaseAuthService.getCurrentUser();
      currentUserID = res.userID;
      return res;
    }
    return null;
  }

  @override
  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      var res = await _firebaseDBService.updateUserToDB(currentUserID, extraPrms);
      return res;
    }
    return null;
  }
}
