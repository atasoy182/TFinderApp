import 'package:flutter/material.dart';
import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/tf_user_repository.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';

enum ViewState { Idle, Busy }

class TfUserViewModel with ChangeNotifier implements AuthFirebaseService {
  ViewState _state = ViewState.Idle;
  TfUserRepository _tfUserRepository = locator.get<TfUserRepository>();
  TfUser _tfUser;
  String eMailCevap;

  TfUser get tfUser => _tfUser;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  TfUserViewModel() {
    getCurrentUser();
  }

  @override
  Future<TfUser> getCurrentUser() async {
    try {
      state = ViewState.Busy;
      return await _tfUserRepository.getCurrentUser();
    } catch (e) {
      print("View model get Current User hatası:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<TfUser> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      return await _tfUserRepository.signInAnonymously();
    } catch (e) {
      print("View model signInAnonymously hatası:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      _tfUser = null;
      return await _tfUserRepository.signOut();
    } catch (e) {
      print("View model signOut hatası:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<TfUser> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _tfUser = await _tfUserRepository.signInWithGoogle();
      return _tfUser;
    } catch (e) {
      debugPrint(
          "UserModel View modeldeki signInWithGmail hatası ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<TfUser> createTfUserWithEmail(String email, String password) async {
    try {
      state = ViewState.Busy;
      _tfUser = await _tfUserRepository.createTfUserWithEmail(email, password);
      return _tfUser;
    } catch (e) {
      debugPrint(
          "UserModel View modeldeki createTfUserWithEmail hatası ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<TfUser> signInWithEmail(String email, String password) async {
    try {
      state = ViewState.Busy;
      _tfUser = await _tfUserRepository.signInWithEmail(email, password);
      return _tfUser;
    } catch (e) {
      debugPrint(
          "UserModel View modeldeki signInWithEmail hatası ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    eMailCevap = "";
    try {
      state = ViewState.Busy;

      var result = await _tfUserRepository.forgotPassword(email);

      if (!result) {
        eMailCevap = "Belirtilen Mail Sistemde Bulunamadi !";
      } else {
        eMailCevap = "Mail Gönderilmiştir.";
      }

      return result;
    } catch (e) {
      debugPrint(
          "UserModel View modeldeki forgotPassword hatası ${e.toString()}");
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
