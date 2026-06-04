import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab4/main.dart';

void main() {
  testWidgets('Lab4 home menu opens core widgets demo', (tester) async {
    await tester.pumpWidget(const Lab4App());
    await tester.pumpAndSettle();

    expect(find.text('Exercise 1 - Core Widget Demo'), findsOneWidget);

    await tester.tap(find.text('Exercise 1 - Core Widget Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Flutter Core Widgets'), findsOneWidget);
  });
}
