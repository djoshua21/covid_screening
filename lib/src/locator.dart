import 'package:get_it/get_it.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/core/services/user_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
}
