import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/views/incomplete_task_page_view.dart';

Widget createInCompleteTaskScreen() => MaterialApp(
      home: IncompleteTaskPage(
          title: "Incomplete",
          description: 'No data, please create the task new'),
    );

void main() {
  Get.lazyPut(() => AllTaskPageController());
  Get.put(IncompleteTaskPageController());

  group('All Page Task Widget Tests', () {
    testWidgets('MyWidget has a Title and Decription',
        (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(createInCompleteTaskScreen());

      // Create the Finders.
      final titleFinder = find.text('Incomplete');
      final messageFinder = find.text('No data, please create the task new');

      // Use the `findsOneWidget` matcher provided by flutter_test to
      // verify that the Text widgets appear exactly once in the widget tree.
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });
    testWidgets('Testing if Container shows up', (tester) async {
      await tester.pumpWidget(createInCompleteTaskScreen());
      expect(find.byType(Container), findsWidgets);
    });

    // testWidgets('Testing IconButtons', (tester) async {
    //   await tester.pumpWidget(createHomeScreen());
    //   expect(find.byIcon(Icons.favorite), findsNothing);
    //   await tester.tap(find.byIcon(Icons.favorite_border).first);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   expect(find.text('Added to favorites.'), findsOneWidget);
    //   expect(find.byIcon(Icons.favorite), findsWidgets);
    //   await tester.tap(find.byIcon(Icons.favorite).first);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   expect(find.text('Removed from favorites.'), findsOneWidget);
    //   expect(find.byIcon(Icons.favorite), findsNothing);
    // });
  });
}
