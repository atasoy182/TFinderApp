import 'package:get_it/get_it.dart';
import 'package:tfinder_app/repository/profile_edit_repository.dart';
import 'package:tfinder_app/repository/tf_user_repository.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';
import 'package:tfinder_app/services/firebase_db_service.dart';
import 'package:tfinder_app/services/firebase_storage_service.dart';

import 'services/sqflite_db_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthFirebaseService());
  locator.registerLazySingleton(() => TfUserRepository());
  locator.registerLazySingleton(() => DBFirebaseService());
  locator.registerLazySingleton(() => ProfileEditRepository());
  locator.registerLazySingleton(() => DBSQFLiteService());
  locator.registerLazySingleton(() => FirebaseStorageService());
}
