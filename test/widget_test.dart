// 应用冒烟测试：确认 luamris_ui 主题与首页组件正常渲染。

import 'package:flutter_test/flutter_test.dart';

import 'package:photstatt_app/main.dart';

void main() {
  testWidgets('Home page renders with luamris_ui theme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PhotstattApp());

    expect(find.text('欢迎使用 luamris_ui'), findsOneWidget);
    expect(find.text('主按钮'), findsOneWidget);
  });
}
