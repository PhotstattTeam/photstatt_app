import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:luamris_ui/luamris_ui.dart';
import 'package:material_ui/material_ui.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const PhotstattApp());
}

/// 应用根组件。
///
/// 主题全部由 [McThemeData] 统一生成：[McThemeData.materialTheme] 会自动
/// 配置 ColorScheme、AppBar、Card、InputDecoration 等组件主题，并注册
/// [McColors] 扩展，因此任何页面都可以通过 `context.mc.xxx` 取到设计 Token。
class PhotstattApp extends StatefulWidget {
  const PhotstattApp({super.key});

  @override
  State<PhotstattApp> createState() => _PhotstattAppState();
}

class _PhotstattAppState extends State<PhotstattApp> {
  /// 默认跟随系统；用户手动切换后变为 light / dark。
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      // 国际化：框架组件（日期选择、返回按钮等）与业务文案都支持中英文。
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: _themeMode,
      theme: McThemeData.materialTheme(McColors.light),
      darkTheme: McThemeData.materialTheme(McColors.dark),
      home: HomePage(onToggleTheme: _toggleTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onToggleTheme});

  /// 参数为当前是否为暗色模式。
  final ValueChanged<bool> onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final m = context.mc;
    final l10n = AppLocalizations.of(context);
    final isDark = m.brightness == Brightness.dark;

    return McPageScaffold(
      title: l10n.appTitle,
      trailing: McButton.ghost(
        onPressed: () => onToggleTheme(isDark),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Icon(
          isDark ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
          color: m.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          McCard.elevated(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.welcomeTitle, style: m.textTitle),
                const SizedBox(height: 8),
                Text(l10n.welcomeDescription, style: m.textMuted),
              ],
            ),
          ),
          const SizedBox(height: 16),
          McCard.grouped(
            child: Column(
              children: [
                McListTile(
                  leading: Icon(CupertinoIcons.paintbrush, color: m.primary),
                  title: Text(l10n.themeMode),
                  subtitle: Text(isDark ? l10n.themeDark : l10n.themeLight),
                  showChevron: true,
                  onTap: () => onToggleTheme(isDark),
                ),
                McListTile(
                  leading: Icon(CupertinoIcons.drop, color: m.indigo),
                  title: Text(l10n.primaryColor),
                  subtitle: Text(l10n.primaryColorValue),
                  showChevron: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          McButton.primary(
            onPressed: () {},
            child: Text(l10n.primaryButton),
          ),
          const SizedBox(height: 12),
          McButton.secondary(
            onPressed: () {},
            child: Text(l10n.secondaryButton),
          ),
        ],
      ),
    );
  }
}
