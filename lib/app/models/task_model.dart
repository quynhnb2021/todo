import 'package:flutter/material.dart';

class TaskFields {
  static final List<String> values = [
    /// Add all fields
    id, status, title, time
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String status = 'status';
  static final String time = 'time';
}

final String tableTasks = 'tasks';

class Task extends ChangeNotifier {
  final int? id;
  final String? title;
  final bool status;
  final DateTime createdTime;

  Task({
    this.id,
    required this.title,
    required this.status,
    required this.createdTime,
  });

  Task copy({
    int? id,
    bool? status,
    String? title,
    DateTime? createdTime,
  }) =>
      Task(
        id: id ?? this.id,
        status: status ?? this.status,
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        status: json[TaskFields.status] == 1,
        title: json[TaskFields.title] as String,
        createdTime: DateTime.parse(json[TaskFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.status: status ? 1 : 0,
        TaskFields.time: createdTime.toIso8601String(),
      };
}
