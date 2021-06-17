import 'package:get_it/get_it.dart';
import 'package:tfinder_app/services/auth_firebase_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthFirebaseService());
}
