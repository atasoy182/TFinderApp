import 'package:tfinder_app/model/tf_user_model.dart';

abstract class AuthBase {
  Future<TfUser> getCurrentUser();
  Future<TfUser> signInAnonymously();
  Future<bool> signOut();
}
