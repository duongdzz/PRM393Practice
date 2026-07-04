import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/habit_controller.dart';
import '../widgets/add_habit_dialog.dart';
import '../widgets/empty_habit_state.dart';
import '../widgets/habit_list_view.dart';

class HomeScreen extends GetView<HabitController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.habits.isEmpty
            ? const EmptyHabitState()
            : HabitListView(
                habits: controller.habits.toList(),
                controller: controller,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AddHabitDialog.show(controller),
        tooltip: 'Thêm thói quen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
