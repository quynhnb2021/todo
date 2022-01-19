import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/all_task_page/views/all_task_page_view.dart';

Widget createHomeScreen() => MaterialApp(
      home: AllTaskPage(title: "All", nameTask: "Create task"),
    );

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

// Widget createHomeScreen() => MyWidget(title: 'T', message: 'M');

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Get.put(AllTaskPageController());
  // testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
  //   // Create the widget by telling the tester to build it.
  //   await tester.pumpWidget(createHomeScreen());
  // });
  testWidgets('MyWidget has an “Create task” UI', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createHomeScreen());

    // Create the Finders.
    final titleFinder = find.text('All');
    final messageFinder = find.text('Create task');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    //  expect(find.text('Create task'), findsOneWidget);
  });
  // group('All Page  Task Widget Tests', () {
  //   // testWidgets('Testing if ListView shows up', (tester) async {
  //   //   await tester.pumpWidget(createHomeScreen());
  //   //   expect(find.byType(ListView), findsOneWidget);
  //   // });

  //   testWidgets('MyWidget has an “Create task” UI', (WidgetTester tester) async {
  //     // Create the widget by telling the tester to build it.
  //     await tester.pumpWidget(AllTaskPage(title: "All", nameTask: "Create task"));

  //     // Create the Finders.
  //     final titleFinder = find.text('All');
  //     final messageFinder = find.text('Create task');

  //     // Use the `findsOneWidget` matcher provided by flutter_test to
  //     // verify that the Text widgets appear exactly once in the widget tree.
  //     expect(titleFinder, findsOneWidget);
  //     expect(messageFinder, findsOneWidget);
  //     //  expect(find.text('Create task'), findsOneWidget);
  //   });

  //   //   testWidgets('Testing Scrolling', (tester) async {
  //   //     await tester.pumpWidget(createHomeScreen());
  //   //     expect(find.text('Item 0'), findsOneWidget);
  //   //     await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
  //   //     await tester.pumpAndSettle();
  //   //     expect(find.text('Item 0'), findsNothing);
  //   //   });

  //   //   testWidgets('Testing IconButtons', (tester) async {
  //   //     await tester.pumpWidget(createHomeScreen());
  //   //     expect(find.byIcon(Icons.favorite), findsNothing);
  //   //     await tester.tap(find.byIcon(Icons.favorite_border).first);
  //   //     await tester.pumpAndSettle(const Duration(seconds: 1));
  //   //     expect(find.text('Added to favorites.'), findsOneWidget);
  //   //     expect(find.byIcon(Icons.favorite), findsWidgets);
  //   //     await tester.tap(find.byIcon(Icons.favorite).first);
  //   //     await tester.pumpAndSettle(const Duration(seconds: 1));
  //   //     expect(find.text('Removed from favorites.'), findsOneWidget);
  //   //     expect(find.byIcon(Icons.favorite), findsNothing);
  //   //   });
  // });
}
