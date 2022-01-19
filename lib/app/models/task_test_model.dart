import 'package:todo/app/models/task_model.dart';

class ListTask {
  List<Task> mockTasks = [
    Task(id: 1, title: "Product1", status: true, createdTime: DateTime.now()),
    Task(
      id: 2,
      title: "Product2",
      status: true,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    ),
    Task(
      id: 3,
      title: "Product3",
      status: false,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    ),
    Task(
      id: 4,
      title: "Product4",
      status: false,
      createdTime: DateTime.now().add(Duration(minutes: 1)),
    )
  ];
  // final mockettasks = [
  //   Task(name: "A2", status: false,),
  //   Task(name: "B1", status: false),
  //   Task(name: "B1", status: true),
  //   Task(name: "Ab1", status: true),
  //   Task(name: "A1", status: true),
  //   Task(name: "A2", status: false),
  //   Task(name: "B1", status: false),
  //   Task(name: "B1", status: true),
  //   Task(name: "Ab1", status: true)
  // ];

  void increment() => value++;

  void decrement() => value--;
}
