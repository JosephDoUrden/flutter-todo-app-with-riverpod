import 'package:todo_app_riverpod/data/data.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _datasource;

  TaskRepositoryImpl(this._datasource);

  @override
  Future<void> createTask(Task task) async {
    try {
      await _datasource.createTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTasks() async {
    try {
      return await _datasource.getTasks();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      rethrow;
    }
  }
}
