import 'package:tfinder_app/model/tf_user_model.dart';

abstract class AuthBase {
  Future<TfUser> getCurrentUser();
  Future<TfUser> signInAnonymously();
  Future<bool> signOut();
  Future<TfUser> signInWithGmail();
  Future<TfUser> signInEmailAndPassword(String email, String password);
  Future<TfUser> createUserWithEmailAndPassword(String email, String password);
}
