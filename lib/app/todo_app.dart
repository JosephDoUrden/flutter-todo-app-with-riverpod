import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/config/config.dart';
import 'package:todo_app_riverpod/screens/screens.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
