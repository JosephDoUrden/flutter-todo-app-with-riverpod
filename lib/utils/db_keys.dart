import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

@immutable
class DBKeys {
  const DBKeys._();
  static const String dbName = 'tasks.db';
  static const String dbTable = 'tasks';
  static const String idColumn = TaskKeys.id;
  static const String titleColumn = TaskKeys.title;
  static const String categoryColumn = TaskKeys.category;
  static const String descriptionColumn = TaskKeys.description;
  static const String dateColumn = TaskKeys.date;
  static const String isDoneColumn = TaskKeys.isDone;
}
