import 'package:get/get.dart';

import '../models/habit.dart';
import '../services/habit_storage.dart';

class HabitController extends GetxController {
  final HabitStorage _storage = HabitStorage();
  final habits = <Habit>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    final loadedHabits = await _storage.loadHabits();
    habits.assignAll(loadedHabits);
  }

  Future<void> _persistHabits() async {
    await _storage.saveHabits(habits.toList());
  }

  void addHabit(Habit habit) {
    habits.add(habit);
    _persistHabits();
  }

  void addHabitFromTitle(String title) {
    addHabit(
      Habit(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title.trim(),
      ),
    );
  }

  void removeHabit(String id) {
    habits.removeWhere((habit) => habit.id == id);
    _persistHabits();
  }

  void updateHabit(Habit habit) {
    final index = habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      habits[index] = habit;
      _persistHabits();
    }
  }

  void toggleCompleted(String id) {
    final index = habits.indexWhere((h) => h.id == id);
    if (index != -1) {
      habits[index] = habits[index].copyWith(
        isCompleted: !habits[index].isCompleted,
      );
      _persistHabits();
    }
  }
}
