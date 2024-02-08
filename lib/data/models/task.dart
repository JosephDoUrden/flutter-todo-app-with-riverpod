// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_app_riverpod/utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String description;
  final String date;
  final String time;
  final TaskCategories category;
  final bool isDone;

  const Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
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
      time,
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
      TaskKeys.time: time,
      TaskKeys.category: category.name,
      TaskKeys.isDone: isDone ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      description: map[TaskKeys.description],
      date: map[TaskKeys.date],
      time: map[TaskKeys.time],
      category: TaskCategories.stringToTaskCategory(map[TaskKeys.category]),
      isDone: map['isDone'] == 1 ? true : false,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? time,
    TaskCategories? category,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
    );
  }
}
