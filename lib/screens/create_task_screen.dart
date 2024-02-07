import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) => const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Create Task', fontSize: 20),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(taskTitle: 'Task Title', hintText: 'Enter task title'),
            const Gap(16),
            const SelectDateTime(),
            const Gap(16),
            const CommonTextField(
              taskTitle: 'Description',
              hintText: 'Enter task description',
              maxLines: 6,
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: () {},
              child: const DisplayWhiteText(
                text: 'Create Task',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}