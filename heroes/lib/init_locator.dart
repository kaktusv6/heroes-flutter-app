import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:heroes/storages/api_key.dart';
import 'package:heroes/storages/storage_token.dart';

import 'api/heroes_api.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => FlutterSecureStorage());
  locator.registerLazySingleton(() => TokenStorage());
  locator.registerLazySingleton(() => ApiKeyStorage());
  locator.registerLazySingleton(() => HeroesApiClient());
}
