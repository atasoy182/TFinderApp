import 'package:firebase_auth/firebase_auth.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/auth_base.dart';

class AuthFirebaseService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TfUser> getCurrentUser() async {
    User user = await _firebaseAuth.currentUser;
  }

  Future<TfUser> _userFromFirebase(User user) async {
    /*
    FirebaseUser nesnesini TfUser nesnesine dönüştüren metottur.
     */
    if (user == null) return null;

    return TfUser(userID: user.uid);
  }

  @override
  Future<TfUser> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
