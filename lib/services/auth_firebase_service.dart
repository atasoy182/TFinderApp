import 'package:firebase_auth/firebase_auth.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';

class AuthFirebaseService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TfUser> getCurrentUser() async {
    try {
      User user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print("get current user hatası: " + e.toString());
    }
  }

  Future<TfUser> _userFromFirebase(User user) async {
    /*
    FirebaseUser nesnesini TfUser nesnesine dönüştüren metottur.
     */
    if (user == null) return null;

    return TfUser(userID: user.uid);
  }

  @override
  Future<TfUser> signInAnonymously() async {
    try {
      UserCredential _userCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(_userCredential.user);
    } catch (e) {
      print("signInAnonymously  hatası: " + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("signOut user hatası: " + e.toString());
      return false;
    }
  }
}
