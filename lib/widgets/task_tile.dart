import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double iconOpacity = task.isDone ? 0.3 : 0.5;
    final backgroundOpacity = task.isDone ? 0.1 : 0.3;
    final textDecoration = task.isDone ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isDone ? FontWeight.normal : FontWeight.bold;

    return Row(
      children: [
        CircleContainer(
          color: task.category.color.withOpacity(backgroundOpacity),
          child: Center(
            child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                  fontSize: 20,
                  fontWeight: fontWeight,
                ),
              ),
              Row(
                children: [
                  Text(
                    task.time,
                    style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    task.date,
                    style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Checkbox(
          value: task.isDone,
          onChanged: onCompleted,
        )
      ],
    );
  }
}
