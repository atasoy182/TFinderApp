import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/database_base.dart';

class DBSQFLiteService implements DBBase {
  @override
  Future<bool> eMailVarMi(String email) {
    // TODO: implement eMailVarMi
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms) {
    // TODO: implement saveUserToDB
    throw UnimplementedError();
  }

  @override
  Future<TfUser> getCurrentTfUser() {
    // TODO: implement getCurrentTfUser
    throw UnimplementedError();
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
  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms) {
    // TODO: implement updateUserToDB
    throw UnimplementedError();
  }

  @override
  Future<bool> addComment(String yazanKullaniciAdSoyad, String yazanProfilUrl, String yazilanKullaniciId, String yorum) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<List> getCommentsWithPagination(String getirilecekUserId, sonTarih, int getirilecekElemanSayisi) {
    // TODO: implement getCommentsWithPagination
    throw UnimplementedError();
  }

  @override
  Future<List> getNearTeachers(String x1, String y1, String x2, String y2, List getirilenLokasyonlar) {
    // TODO: implement getNearTeachers
    throw UnimplementedError();
  }

}
