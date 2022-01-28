import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';

import '../controllers/all_task_page_controller.dart';

class AllTaskView extends GetView<AllTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return AllTaskPage(title: "All Task", nameTask: "Create task");
  }
}

class AllTaskPage extends StatelessWidget {
  const AllTaskPage({
    Key? key,
    required this.title,
    required this.nameTask,
  }) : super(key: key);
  final String title;
  final String nameTask;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllTaskPageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => TextFieldAlertDialog(
                          title: "Create task",
                          titleButton: "SUBMIT",
                          hintText: "Wrire task here ...",
                          toast: "Please fill task above",
                        ));
              },
              child: Text(
                nameTask,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Obx(
              () => Expanded(
                child: controller.tasks.length > 0
                    ? ListView.builder(
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) =>
                            allTask(controller.tasks[index], controller, index),
                      )
                    : Center(
                        child: Text(
                          'No data, please create the task new',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  allTask(Task task, AllTaskPageController controller, int index) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              task.title ?? "",
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(
              width: 16,
            ),
            Checkbox(
                value: task.status,
                onChanged: (bool? value) {
                  controller.tapTask(task, index);
                })
          ],
        ),
      );
}

// ignore: must_be_immutable
class TextFieldAlertDialog extends StatelessWidget {
  TextFieldAlertDialog({
    Key? key,
    required this.title,
    required this.titleButton,
    required this.hintText,
    required this.toast,
  }) : super(key: key);
  TextEditingController taskTextField = TextEditingController();
  final controller = Get.find<AllTaskPageController>();
  final String title;
  final String titleButton;
  final String hintText;
  final String toast;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AlertDialog(
      title: Text(title),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 8 / 10,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: taskTextField,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(hintText: hintText),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Obx(
            () => Checkbox(
                value: controller.isChecked.value,
                onChanged: (bool? value) {
                  controller.tapCheckBox(value);
                }),
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text(titleButton),
          onPressed: () {
            if (taskTextField.text.isEmpty) {
              Fluttertoast.showToast(
                msg: toast,
              );
              return;
            }
            controller.tapSubmit(taskTextField.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
