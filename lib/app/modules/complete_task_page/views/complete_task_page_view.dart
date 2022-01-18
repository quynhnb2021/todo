import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complete_task_page_controller.dart';

class CompleteTaskPageView extends GetView<CompleteTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompleteTaskPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompleteTaskPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
