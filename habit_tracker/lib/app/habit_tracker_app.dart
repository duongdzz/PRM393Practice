import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/habit_binding.dart';
import '../core/theme/app_theme.dart';
import '../screens/home_screen.dart';

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: AppTheme.light,
      initialBinding: HabitBinding(),
      home: const HomeScreen(),
    );
  }
}
