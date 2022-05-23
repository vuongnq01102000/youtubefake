import 'dart:async';

abstract class LocalSettings {
  Future<void> initLocalSetting(String filename);

  Future<void> clearAllData();

  Future<void> write(String key, String value);

  Future<String?> read(String key);

  Future<void> remove(String key);
}
