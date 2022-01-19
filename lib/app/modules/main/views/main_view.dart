import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/views/all_task_page_view.dart';
import 'package:todo/app/modules/complete_task_page/views/complete_task_page_view.dart';
import 'package:todo/app/modules/incomplete_task_page/views/incomplete_task_page_view.dart';
import 'package:todo/app/themes/app_styles.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [CompleteTaskView(), AllTaskView(), IncompleteTaskView()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(boxShadow: boxShadow),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            unselectedItemColor: colorNeutralGray60,
            selectedItemColor: colorPrimaryBlue100,
            selectedLabelStyle: typoSemiBold14,
            unselectedLabelStyle: typoRegular14,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            items: [
              _bottomNavigationBarItem(
                label: "Complete",
              ),
              _bottomNavigationBarItem(
                label: "All",
              ),
              _bottomNavigationBarItem(
                label: "Incomplete",
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({required String label}) {
    return BottomNavigationBarItem(
      icon: SizedBox(),
      label: label,
    );
  }
}
