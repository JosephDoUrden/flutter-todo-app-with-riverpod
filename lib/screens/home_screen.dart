import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class HomeScreen extends StatelessWidget {
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
                      const Gap(30),
                      Text(
                        'Jan 23, 2024',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: colors.surface,
                          fontSize: 20,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'My Todo List',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: colors.surface,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
