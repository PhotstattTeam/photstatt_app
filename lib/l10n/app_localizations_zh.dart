// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Photstatt';

  @override
  String get welcomeTitle => '欢迎使用 luamris_ui';

  @override
  String get welcomeDescription => 'Apple 风格组件库已接入，亮色 / 暗色主题会自动切换。';

  @override
  String get themeMode => '主题模式';

  @override
  String get themeLight => '当前：亮色';

  @override
  String get themeDark => '当前：暗色';

  @override
  String get primaryColor => '主色';

  @override
  String get primaryColorValue => 'iOS 系统蓝 #007AFF';

  @override
  String get primaryButton => '主按钮';

  @override
  String get secondaryButton => '次要按钮';
}
