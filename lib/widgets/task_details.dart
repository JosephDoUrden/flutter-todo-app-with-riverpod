import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            task.date,
            style: style.titleMedium,
          ),
          const Gap(16),
          Text(
            task.description.isEmpty ? 'No description' : task.description,
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          task.isDone
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('task completed!'),
                    Icon(Icons.check_box, color: Colors.green),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('task to be completed on ${task.date}'),
                    Icon(Icons.check_box, color: task.category.color),
                  ],
                ),
        ],
      ),
    );
  }
}
