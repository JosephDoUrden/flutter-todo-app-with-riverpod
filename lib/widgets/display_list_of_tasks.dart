import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/providers/providers.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

import '../data/data.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isDone = false,
  });

  final List<Task> tasks;
  final bool isDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height = isDone ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isDone ? 'No completed task' : 'No task yet';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref.read(taskProvider.notifier).updateTask(task);
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(10);
              },
            ),
    );
  }
}
