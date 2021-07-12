import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/tf_user_repository.dart';
import 'package:tfinder_app/services/database_base.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';
import 'package:tfinder_app/services/sqflite_db_service.dart';

class ProfileRepository implements DBBase {
  AppMode _appMode = AppMode.RELEASE;
  DBFirebaseService _firebaseDBService = locator.get<DBFirebaseService>();
  DBSQFLiteService _sqfLiteDBService = locator.get<DBSQFLiteService>();

  @override
  Future<bool> eMailVarMi(String email) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.eMailVarMi(email);
    }
    return null;
  }

  @override
  Future<bool> saveUserToDB(
      TfUser tfUser, Map<String, dynamic> extraPrms) async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseDBService.saveUserToDB(tfUser, extraPrms);
    }
    return null;
  }
}
