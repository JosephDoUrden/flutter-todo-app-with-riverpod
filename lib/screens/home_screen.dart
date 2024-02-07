import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/config/router/router.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                      tasks: [
                        Task(
                          title: 'titleLarge',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.education,
                          isDone: false,
                        ),
                        Task(
                          title: 'Task 2',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.work,
                          isDone: false,
                        ),
                        Task(
                          title: 'Task 3',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.health,
                          isDone: false,
                        )
                      ],
                    ),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: 'Task 4',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.others,
                          isDone: true,
                        ),
                        Task(
                          title: 'Task 5',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.personal,
                          isDone: true,
                        ),
                        Task(
                          title: 'Task 6',
                          description: 'description',
                          date: DateTime.now(),
                          category: TaskCategories.shopping,
                          isDone: true,
                        )
                      ],
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
}
