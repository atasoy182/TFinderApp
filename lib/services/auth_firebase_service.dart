import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';

class AuthFirebaseService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TfUser> getCurrentUser() async {
    try {
      User user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
      //print("get current user hatası: " + e.toString());
    }
  }

  Future<TfUser> _userFromFirebase(User user) async {
    /*
    FirebaseUser nesnesini TfUser nesnesine dönüştüren metottur.
     */
    if (user == null) return null;

    return TfUser(
        userID: user.uid, email: user.email, adSoyad: user.displayName);
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
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("signOut user hatası: " + e.toString());
      return false;
    }
  }

  @override
  Future<TfUser> signInWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      if (_googleUser != null) {
        GoogleSignInAuthentication _googleAuth =
            await _googleUser.authentication;
        if (_googleAuth.accessToken != null && _googleAuth.idToken != null) {
          UserCredential authResult = await _firebaseAuth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: _googleAuth.idToken,
                  accessToken: _googleAuth.accessToken));
          User user = authResult.user;
          return _userFromFirebase(user);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("Gmail oturum açma hatası " + e.toString());
      return null;
    }
  }

  @override
  Future<TfUser> createTfUserWithEmail(
      String email, String password, Map<String, dynamic> extraPrms) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(_userCredential.user);
    } catch (e) {
      print("createTfUserWithEmail  hatası: " + e.toString());
      return null;
    }
  }

  @override
  Future<TfUser> signInWithEmail(String email, String password) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(_userCredential.user);
    } catch (e) {
      print("signInWithEmail  hatası: " + e.toString());
      return null;
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print("forgotPassword  hatası: " + e.toString());
      return false;
    }
  }
}
