import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_riverpod/config/router/router.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/providers/providers.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();

  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Create Task', fontSize: 20),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                taskTitle: 'Task Title',
                hintText: 'Enter task title',
                controller: _titleController,
              ),
              const Gap(16),
              const SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                taskTitle: 'Description',
                hintText: 'Enter task description',
                maxLines: 6,
                controller: _descriptionController,
              ),
              const Gap(16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _createTask,
                child: const DisplayWhiteText(
                  text: 'Create Task',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final category = ref.watch(categoryProvider);
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        description: description,
        date: DateFormat.yMMMd().format(date),
        time: time.format(context),
        category: category,
        isDone: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackBar(context, 'Task title cannot be empty');
    }
  }
}
