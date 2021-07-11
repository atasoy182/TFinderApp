import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/services/database_base.dart';

class DBFirebaseService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUserToDB(
      TfUser tfUser, Map<String, dynamic> extraPrms) async {
    Map _eklenecekMap = tfUser.toMap();

    print("111. _eklenecekMap" + _eklenecekMap.toString());

    _eklenecekMap.addAll(extraPrms);

    print("222. _eklenecekMap" + _eklenecekMap.toString());

    await _firestore.collection("users").doc(tfUser.userID).set(_eklenecekMap);
    return true;
  }

  @override
  Future<bool> eMailVarMi(String email) async {
    var users = await _firestore
        .collection("users")
        .where(TFC.email, isEqualTo: email)
        .get();
    if (users.docs.length >= 1) {
      return true;
    } else {
      return false;
    }
  }
}
