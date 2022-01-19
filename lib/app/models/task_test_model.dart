import 'package:todo/app/models/task_model.dart';

class ListTask {
  List<Task> mockTasks = [
    Task(
      id: 1,
      title: "Item1",
      status: true,
      createdTime: DateTime.now(),
    ),
    Task(
      id: 2,
      title: "Item2",
      status: true,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    ),
    Task(
      id: 3,
      title: "Item3",
      status: false,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    ),
    Task(
      id: 4,
      title: "Item4",
      status: false,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    )
  ];

  void add(Task task) {
    mockTasks.add(task);
  }
}
