import 'package:youtubefake/core/injection.dart';
import 'package:youtubefake/core/local_settings.dart/local_settings.dart';
import 'package:youtubefake/core/local_settings.dart/shared_preferences_storage.dart';

class BaseCode {
  static final BaseCode _baseCode = BaseCode._internal();

  factory BaseCode() => _baseCode;

  BaseCode._internal();

  static BaseCode get instance => _baseCode;

  late LocalSettings localSettings;

  void initBaseCode({LocalSettings? localSettings}) {
    this.localSettings = localSettings ?? SharedPreferencesStorage();
    Injection.init();
  }

  Future<void> initLocalSetting(String filename) async =>
      await localSettings.initLocalSetting(filename);
}
