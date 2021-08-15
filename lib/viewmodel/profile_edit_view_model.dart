import 'package:flutter/material.dart';
import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/profile_edit_repository.dart';
import 'package:tfinder_app/services/database_base.dart';

enum ViewState { Idle, Busy }

class ProfileEditViewModel with ChangeNotifier implements DBBase {
  ProfileEditRepository _profileRepository = locator.get<ProfileEditRepository>();
  Map<String, dynamic> extraPrms = {};

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<bool> eMailVarMi(String email) async {
    return await _profileRepository.eMailVarMi(email);
  }

  @override
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) async {
    return await _profileRepository.saveUserToDB(tfUser, extraPrms);
  }

  @override
  Future<TfUser> getCurrentTfUser() async {
    try {
      state = ViewState.Busy;
      return await _profileRepository.getCurrentTfUser();
    } catch (e) {
      print("Profile Edit View Model Current User hatası:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  Future<bool> doldurBilgiler() async {
    state = ViewState.Busy;
    TfUser _user = await getCurrentTfUser();
    print("doldurBilgiler:" + _user.toString());
    extraPrms['adsoyad'] = "AHMET";
    // TO DO bilgiler getirilip ekrana yansıtılabiliyor...
    return true;
  }
}
