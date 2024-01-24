// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      date,
      isDone,
    ];
  }
}
