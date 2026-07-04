import 'package:flutter/material.dart';

import '../controllers/habit_controller.dart';
import '../core/constants/app_spacing.dart';
import '../models/habit.dart';
import 'habit_card.dart';

class HabitListView extends StatelessWidget {
  const HabitListView({
    super.key,
    required this.habits,
    required this.controller,
  });

  final List<Habit> habits;
  final HabitController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.listPadding,
      ),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];

        return HabitCard(
          habit: habit,
          onToggle: () => controller.toggleCompleted(habit.id),
          onDelete: () => controller.removeHabit(habit.id),
        );
      },
    );
  }
}
