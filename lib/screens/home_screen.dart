import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/config/router/router.dart';
import 'package:todo_app_riverpod/providers/task/task.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks);
    final incompleteTasks = _incompleteTasks(taskState.tasks);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                        fontSize: 20,
                      ),
                      const DisplayWhiteText(
                        text: "Getir Bi'todo",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.15,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(
                      tasks: incompleteTasks,
                    ),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayListOfTask(
                      tasks: completedTasks,
                      isDone: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () => context.push(RouteLocation.create),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(
                            text: 'Add Todo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks) => tasks.where((task) => task.isDone).toList();
  List<Task> _incompleteTasks(List<Task> tasks) => tasks.where((task) => !task.isDone).toList();
}
