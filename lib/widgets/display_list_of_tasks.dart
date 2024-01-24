import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

import '../data/data.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isDone = false,
  });

  final List<Task> tasks;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
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
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text('Todo $index'),
                );
              },
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
            ),
    );
  }
}
