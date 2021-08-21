import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tfinder_app/locator.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/repository/tf_user_repository.dart';
import 'package:tfinder_app/services/database_base.dart';

enum ViewState { Idle, Busy }

class ProfileEditViewModel with ChangeNotifier {
  TfUserRepository _tfUserRepository = locator.get<TfUserRepository>();
  Map<String, dynamic> extraPrms = {};

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<bool> doldurBilgiler() async {
    state = ViewState.Busy;
    TfUser _user = await _tfUserRepository.getCurrentUser();
    // TfUser _user = await _tfUserRepository.getCurrentTfUserDetayli(gecici.userID);

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

  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms) async {
    return await _tfUserRepository.updateUserToDB(userID, extraPrms);
  }

  Future<String> uploadFile(String fileType, File yeniImage) async {
    var _indirmeLinki = await _tfUserRepository.uploadFile(fileType, yeniImage);
    return _indirmeLinki;
  }
}
