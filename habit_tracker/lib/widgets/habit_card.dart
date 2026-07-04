import 'package:flutter/material.dart';

import '../core/constants/app_spacing.dart';
import '../models/habit.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({
    super.key,
    required this.habit,
    required this.onToggle,
    required this.onDelete,
  });

  final Habit habit;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          children: [
            Checkbox(
              value: habit.isCompleted,
              onChanged: (_) => onToggle(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Expanded(
              child: Text(
                habit.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      decoration: habit.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: habit.isCompleted
                          ? colorScheme.outline
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: colorScheme.error,
              ),
              tooltip: 'Xóa thói quen',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
