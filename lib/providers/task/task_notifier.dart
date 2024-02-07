import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/providers/task/task.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TaskNotifier(this._repository) : super(const TaskState.initial()) {
    getTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
    } catch (e) {
      rethrow;
    }
  }

  void getTasks() async {
    try {
      final tasks = await _repository.getTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isDone = !task.isDone;
      final updatedTask = task.copyWith(isDone: isDone);
      await _repository.updateTask(updatedTask);
    } catch (e) {
      rethrow;
    }
  }
}
