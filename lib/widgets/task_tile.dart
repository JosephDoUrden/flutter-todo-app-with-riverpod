import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_riverpod/data/data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: task.category.color.withOpacity(0.3),
            border: Border.all(
              color: task.category.color,
              width: 2,
            ),
          ),
          child: Center(
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title),
              Text(DateFormat.yMMMMd().format(task.date)),
            ],
          ),
        ),
        Checkbox(value: task.isDone, onChanged: (value) {})
      ],
    );
  }
}
