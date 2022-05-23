import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtubefake/core/base/base_code.dart';
import 'package:youtubefake/core/injector.dart';
import 'package:youtubefake/core/local_settings.dart/shared_preferences_storage.dart';
import 'package:youtubefake/page/home/home_page.dart';
import 'package:youtubefake/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();
  BaseCode.instance.initBaseCode(localSettings: SharedPreferencesStorage());
  runZonedGuarded(() async {
    await BaseCode.instance.initLocalSetting('settings');
    runApp(const MyApp());
  }, (error, stackTrace) {
    log('$error');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Mytheme.lightModeTheme,
      home: const HomePage(),
    );
  }
}
