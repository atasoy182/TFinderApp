import 'package:tfinder_app/model/tf_user_model.dart';

abstract class DBBase {
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms);
  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms);
  Future<bool> eMailVarMi(String email);
  Future<bool> kullaniciVarMi(String userID);
  Future<TfUser> getCurrentTfUser();
  Future<TfUser> getCurrentTfUserDetayli(String userID);
  Future<bool> addComment(String yazanKullaniciAdSoyad, String yazanProfilUrl, String yazilanKullaniciId, String yorum);
  Future<List> getCommentsWithPagination(String getirilecekUserId, sonTarih, int getirilecekElemanSayisi);
  Future<List> getNearTeachers(String x1, String y1, String x2, String y2, List getirilenLokasyonlar);
}
