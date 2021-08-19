import 'package:tfinder_app/model/tf_user_model.dart';

abstract class DBBase {
  Future<bool> saveUserToDB(TfUser tfUser, Map<String, dynamic> extraPrms);
  Future<bool> updateUserToDB(String userID, Map<String, dynamic> extraPrms);
  Future<bool> eMailVarMi(String email);
  Future<bool> kullaniciVarMi(String userID);
  Future<TfUser> getCurrentTfUser();
  Future<TfUser> getCurrentTfUserDetayli(String userID);
}
