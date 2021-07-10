import 'package:tfinder_app/model/tf_user_model.dart';

abstract class DBBase {
  Future<bool> saveUserToDB(TfUser tfUser);
}
