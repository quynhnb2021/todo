import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/incomplete_task_page_controller.dart';

class IncompleteTaskPageView extends GetView<IncompleteTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IncompleteTaskPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IncompleteTaskPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
