import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';

enum AppMode { DEBUG, RELEASE }

class TfUserRepository implements AuthBase {
  AuthFirebaseService _firebaseAuthService = locator.get<AuthFirebaseService>();
  AppMode _appMode = AppMode.RELEASE;

  @override
  Future<TfUser> getCurrentUser() async {
    if (_appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.getCurrentUser();
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
      return await _firebaseAuthService.signInWithGoogle();
    }
    return null;
  }
}
