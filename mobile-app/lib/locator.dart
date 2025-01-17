import 'package:get_it/get_it.dart';

import 'core/services/api_services.dart';
import 'core/services/auth_service.dart';
import 'core/services/database_service.dart';
import 'core/services/file_picker_service.dart';
import 'core/services/notification-service.dart';
import 'core/services/local_storage_service.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  // final _instance = await LocalStorageService.getInstance();
  // locator.registerSingleton(_instance);
  locator.registerSingleton(LocalStorageService());

  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<ApiServices>(ApiServices());
  locator.registerLazySingleton(() => FilePickerService());
}
