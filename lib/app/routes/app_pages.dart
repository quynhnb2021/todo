import 'package:get/get.dart';

import 'package:todo/app/modules/all_task_page/bindings/all_task_page_binding.dart';
import 'package:todo/app/modules/all_task_page/views/all_task_page_view.dart';
import 'package:todo/app/modules/complete_task_page/bindings/complete_task_page_binding.dart';
import 'package:todo/app/modules/complete_task_page/views/complete_task_page_view.dart';
import 'package:todo/app/modules/incomplete_task_page/bindings/incomplete_task_page_binding.dart';
import 'package:todo/app/modules/incomplete_task_page/views/incomplete_task_page_view.dart';
import 'package:todo/app/modules/main/bindings/main_binding.dart';
import 'package:todo/app/modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.ALL_TASK_PAGE,
      page: () => AllTaskView(),
      binding: AllTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_TASK_PAGE,
      page: () => CompleteTaskView(),
      binding: CompleteTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.INCOMPLETE_TASK_PAGE,
      page: () => IncompleteTaskView(),
      binding: IncompleteTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
