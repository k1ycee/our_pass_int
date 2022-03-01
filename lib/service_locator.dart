import 'package:get_it/get_it.dart';
import 'package:ourpass_int/navigation/navigation_service.dart';
import 'package:ourpass_int/services/auth/user_auth.dart';
import 'package:ourpass_int/services/db/user_database.dart';

GetIt inject = GetIt.instance;

void injector() {
  inject
      .registerLazySingleton<NavigationHandler>(() => NavigationHandlerImpl());
  inject.registerLazySingleton(() => UserAuthentication());
  inject.registerLazySingleton(() => UserDataBase());
}
