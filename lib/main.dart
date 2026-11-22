import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:luamris_ui/luamris_ui.dart';
import 'package:material_ui/material_ui.dart';

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
      title: 'Photstatt',
      debugShowCheckedModeBanner: false,
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
    final isDark = m.brightness == Brightness.dark;

    return McPageScaffold(
      title: 'Photstatt',
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
                Text('欢迎使用 luamris_ui', style: m.textTitle),
                const SizedBox(height: 8),
                Text(
                  'Apple 风格组件库已接入，亮色 / 暗色主题会自动切换。',
                  style: m.textMuted,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          McCard.grouped(
            child: Column(
              children: [
                McListTile(
                  leading: Icon(CupertinoIcons.paintbrush, color: m.primary),
                  title: const Text('主题模式'),
                  subtitle: Text(isDark ? '当前：暗色' : '当前：亮色'),
                  showChevron: true,
                  onTap: () => onToggleTheme(isDark),
                ),
                McListTile(
                  leading: Icon(CupertinoIcons.drop, color: m.indigo),
                  title: const Text('主色'),
                  subtitle: const Text('iOS 系统蓝 #007AFF'),
                  showChevron: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          McButton.primary(
            onPressed: () {},
            child: const Text('主按钮'),
          ),
          const SizedBox(height: 12),
          McButton.secondary(
            onPressed: () {},
            child: const Text('次要按钮'),
          ),
        ],
      ),
    );
  }
}
