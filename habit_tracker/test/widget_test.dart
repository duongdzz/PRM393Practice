import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit_tracker/app/habit_tracker_app.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('Home screen shows empty state', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());

    expect(find.text('Habit Tracker'), findsOneWidget);
    expect(find.text('Chưa có thói quen nào'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Add habit via dialog updates list', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Thêm thói quen'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Uống nước');
    await tester.tap(find.text('Thêm'));
    await tester.pumpAndSettle();

    expect(find.text('Uống nước'), findsOneWidget);
    expect(find.text('Chưa có thói quen nào'), findsNothing);
  });

  testWidgets('Add habit rejects empty title', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Thêm'));
    await tester.pumpAndSettle();

    expect(find.text('Tên không được để trống'), findsOneWidget);
    expect(find.text('Chưa có thói quen nào'), findsOneWidget);
  });

  testWidgets('Toggle habit completion via checkbox', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Tập thể dục');
    await tester.tap(find.text('Thêm'));
    await tester.pumpAndSettle();

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, isFalse);

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    final checked = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checked.value, isTrue);

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    final unchecked = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(unchecked.value, isFalse);
  });

  testWidgets('Delete habit removes it from list', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Ngủ sớm');
    await tester.tap(find.text('Thêm'));
    await tester.pumpAndSettle();

    expect(find.text('Ngủ sớm'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();

    expect(find.text('Ngủ sớm'), findsNothing);
    expect(find.text('Chưa có thói quen nào'), findsOneWidget);
  });

  testWidgets('Habits persist after app restart', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Đọc sách');
    await tester.tap(find.text('Thêm'));
    await tester.pumpAndSettle();

    expect(find.text('Đọc sách'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    Get.reset();

    await tester.pumpWidget(const HabitTrackerApp());
    await tester.pumpAndSettle();

    expect(find.text('Đọc sách'), findsOneWidget);
    expect(find.text('Chưa có thói quen nào'), findsNothing);
  });
}
