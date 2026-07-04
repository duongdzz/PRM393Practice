import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/habit_controller.dart';
import '../core/constants/app_spacing.dart';
import '../core/validators/habit_validators.dart';

class AddHabitDialog {
  static void show(HabitController controller) {
    final titleController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    Get.dialog<void>(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.dialogRadius),
        ),
        title: const Text('Thêm thói quen'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: titleController,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Tên thói quen',
              prefixIcon: Icon(Icons.edit_outlined),
            ),
            validator: HabitValidators.title,
            onFieldSubmitted: (_) => _submit(formKey, titleController, controller),
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => _submit(formKey, titleController, controller),
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  static void _submit(
    GlobalKey<FormState> formKey,
    TextEditingController titleController,
    HabitController controller,
  ) {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    controller.addHabitFromTitle(titleController.text);
    Get.back();
  }
}
