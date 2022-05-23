import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubefake/core/local_settings.dart/local_settings.dart';

export 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage extends LocalSettings {
  late SharedPreferences _instance;

  @override
  Future<void> initLocalSetting(String filename) async {
    _instance = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clearAllData() async {
    await _instance.clear();
  }

  @override
  Future<String?> read(String key) async {
    return _instance.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await _instance.remove(key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _instance.setString(key, value);
  }
}
