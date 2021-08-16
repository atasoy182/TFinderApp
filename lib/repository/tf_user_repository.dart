import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class TfUserRepository implements AuthBase {
  AuthFirebaseService _firebaseAuthService = locator.get<AuthFirebaseService>();
  DBFirebaseService _firebaseDBService = locator.get<DBFirebaseService>();
  AppMode _appMode = AppMode.RELEASE;
  TfUser girisYapilanKullanici;

  @override
  Future<TfUser> getCurrentUser() async {
    if (_appMode == AppMode.RELEASE) {
      return girisYapilanKullanici = await _firebaseAuthService.getCurrentUser();
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
}
