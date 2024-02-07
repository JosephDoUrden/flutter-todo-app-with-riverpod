// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_app_riverpod/utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final TaskCategories category;
  final bool isDone;

  const Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.isDone,
  });

  @override
  List<Object> get props {
    return [
      id!,
      title,
      description,
      date,
      category,
      isDone,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.description: description,
      TaskKeys.date: date,
      TaskKeys.category: category.name,
      TaskKeys.isDone: isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      description: map[TaskKeys.description],
      date: map[TaskKeys.date],
      category: TaskCategories.stringToCategory(map[TaskKeys.category]),
      isDone: map['isDone'] as bool,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    TaskCategories? category,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
    );
  }
}
