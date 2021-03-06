import 'package:covid_screening_app/src/core/services/auth_service.dart';
import 'package:covid_screening_app/src/core/services/entry_service.dart';
import 'package:covid_screening_app/src/core/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => EntryService());
}
