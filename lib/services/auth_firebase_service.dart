import 'package:firebase_auth/firebase_auth.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';

class AuthFirebaseService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TfUser> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<TfUser> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<TfUser> signInAnonymously() async {
    try {
      UserCredential authResult = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print("SIGN IN ANONYMOUSLY HATASI ${e.toString()}");
      return null;
    }
  }

  @override
  Future<TfUser> signInEmailAndPassword(String email, String password) {
    // TODO: implement signInEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<TfUser> signInWithGmail() {
    // TODO: implement signInWithGmail
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  TfUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return TfUser(userID: user.uid, email: user.email);
    }
  }
}
