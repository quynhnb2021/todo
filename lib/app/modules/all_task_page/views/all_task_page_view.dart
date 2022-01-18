import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_task_page_controller.dart';

class AllTaskPageView extends GetView<AllTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllTaskPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllTaskPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
