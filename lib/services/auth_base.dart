import 'package:tfinder_app/model/tf_user_model.dart';

abstract class AuthBase {
  Future<TfUser> getCurrentUser();
  Future<TfUser> signInAnonymously();
  Future<bool> signOut();
  Future<TfUser> signInWithGoogle();
  Future<TfUser> signInWithEmail(String email, String password);
  Future<TfUser> createTfUserWithEmail(String email, String password);
}
