import 'package:flutter/material.dart';
import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/profile_repository.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';

enum ViewState { Idle, Busy }

class ProfileViewModel with ChangeNotifier implements DBFirebaseService {
  ProfileRepository _profileRepository = locator.get<ProfileRepository>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<bool> eMailVarMi(String email) async {
    try {
      state = ViewState.Busy;
      return await _profileRepository.eMailVarMi(email);
    } catch (e) {
      print("ProfileViewModel eMailVarMi hatası:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) {
    // TODO: implement saveUserToDB
    throw UnimplementedError();
  }
}
