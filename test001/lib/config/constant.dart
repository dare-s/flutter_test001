
import 'package:flutter/foundation.dart';

const int THEME_COLOR = 0xffebebeb;
const int BG_COLOR = 0xffededed;

class Constant {

  static const int status_success = 0;

  static const String server_address = testsever;

  static const String testsever = "http://10.0.3.2:5000/";

  static const int type_sys_update = 1;
  static const int type_refresh_all = 5;

  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
}

class AppConfig {
  static const String appId = 'appId_test';
  static const String appName = 'appName_test';
  static const String version = '0.1';
  static const bool isDebug = kDebugMode;
}

class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}
