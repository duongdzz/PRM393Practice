import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/services/habit_storage.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('saveHabits and loadHabits round trip', () async {
    final storage = HabitStorage();
    final habits = [
      const Habit(id: '1', title: 'Uống nước'),
      const Habit(id: '2', title: 'Tập thể dục', isCompleted: true),
    ];

    await storage.saveHabits(habits);
    final loaded = await storage.loadHabits();

    expect(loaded.length, 2);
    expect(loaded[0].title, 'Uống nước');
    expect(loaded[0].isCompleted, isFalse);
    expect(loaded[1].title, 'Tập thể dục');
    expect(loaded[1].isCompleted, isTrue);
  });

  test('loadHabits returns empty list when no data', () async {
    final storage = HabitStorage();
    final loaded = await storage.loadHabits();

    expect(loaded, isEmpty);
  });
}
