import 'dart:io';

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
    var gecici = await _profileRepository.getCurrentTfUser();
    TfUser _user = await _profileRepository.getCurrentTfUserDetayli(gecici.userID);

    extraPrms[TFC.adSoyad] = _user.adSoyad;
    extraPrms[TFC.email] = _user.email;
    extraPrms[TFC.cepTel] = _user.cepTel;
    extraPrms[TFC.il] = _user.il;
    extraPrms[TFC.ilce] = _user.ilce;
    extraPrms[TFC.dersUcretAraligi] = _user.dersUcretAraligi;
    extraPrms[TFC.yas] = _user.yas;
    extraPrms[TFC.profilFotoURL] = _user.profilFotoURL;
    extraPrms[TFC.videoURL] = _user.videoURL;
    extraPrms[TFC.hakkinda] = _user.hakkinda;
    extraPrms[TFC.deneyimler] = _user.deneyimler;
    extraPrms[TFC.egitimler] = _user.egitimler;
    extraPrms[TFC.program] = _user.program;

    state = ViewState.Idle;

    return true;
  }

  @override
  Future<bool> kullaniciVarMi(String userID) {
    // TODO: implement kullaniciVarMi
    throw UnimplementedError();
  }

  @override
  Future<TfUser> getCurrentTfUserDetayli(String userID) {
    // TODO: implement getCurrentTfUserDetayli
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms) async {
    return await _profileRepository.updateUserToDB(userID, extraPrms);
  }

  Future<String> uploadFile(String fileType, File yeniImage) async {
    var _indirmeLinki = await _profileRepository.uploadFile(fileType, yeniImage);
    return _indirmeLinki;
  }
}
