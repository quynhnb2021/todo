import 'package:test/test.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/models/task_test_model.dart';

void main() {
  group('Unit test todo', () {
    var tasks = ListTask();

    test('A new item should be added', () {
      final task = Task(
        id: 5,
        title: "Item5",
        status: true,
        createdTime: DateTime.now(),
      );
      tasks.add(task);
      expect(tasks.mockTasks.contains(task), true);
    });
    test('A new item should have status is true', () {
      final task = Task(
        id: 6,
        title: "Item6",
        status: true,
        createdTime: DateTime.now(),
      );

      expect(task.status == true, true);
    });
    test('A new item should have status is false', () {
      final task = Task(
        id: 6,
        title: "Item6",
        status: false,
        createdTime: DateTime.now(),
      );

      expect(task.status == false, true);
    });
    test('A new item should have title not blank', () {
      final task = Task(
        id: 6,
        title: "Item6",
        status: false,
        createdTime: DateTime.now(),
      );

      expect(task.title != null || task.title != "", true);
    });

    test('List item should have data', () {
      expect(tasks.mockTasks.length > 0, true);
    });
  });
}
