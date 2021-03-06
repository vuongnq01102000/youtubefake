import 'package:get_it/get_it.dart';
import 'package:youtubefake/core/base/base_code.dart';
import 'package:youtubefake/core/local_settings.dart/local_settings.dart';

export 'package:get_it/get_it.dart';

class Injection {
  static void init() {
    put<LocalSettings>(BaseCode.instance.localSettings);
  }

  static T get<T extends Object>() {
    return GetIt.instance.get<T>();
  }

  static void put<T extends Object>(T instance) {
    GetIt.instance.registerSingleton<T>(instance);
  }

  static void putLazy<T extends Object>(FactoryFunc<T> func) {
    GetIt.instance.registerLazySingleton<T>(func);
  }

  static void putFactory<T extends Object>(FactoryFunc<T> func) {
    GetIt.instance.registerFactory(func);
  }
}
