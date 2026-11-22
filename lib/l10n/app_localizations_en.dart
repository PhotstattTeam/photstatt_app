// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Photstatt';

  @override
  String get welcomeTitle => 'Welcome to luamris_ui';

  @override
  String get welcomeDescription =>
      'Apple-style components are integrated, and light / dark themes switch automatically.';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get themeLight => 'Current: Light';

  @override
  String get themeDark => 'Current: Dark';

  @override
  String get primaryColor => 'Primary color';

  @override
  String get primaryColorValue => 'iOS system blue #007AFF';

  @override
  String get primaryButton => 'Primary button';

  @override
  String get secondaryButton => 'Secondary button';
}
