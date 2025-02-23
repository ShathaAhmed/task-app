import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tesk_app/app.dart';

void main() {
  testWidgets('يتم عرض شاشة تسجيل الدخول بشكل صحيح', (WidgetTester tester) async {
    // بناء التطبيق داخل مضيف الاختبار
    await tester.pumpWidget(const MyApp());

    // التحقق من ظهور عنوان تسجيل الدخول
    expect(find.text('تسجيل الدخول'), findsOneWidget);
  });
}
