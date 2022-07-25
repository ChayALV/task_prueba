import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';

class TaskPage extends GetView<TaskController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('TaskPage')),

      body: SafeArea(
        child: GetBuilder<TaskController>(
          builder: ((controller) => Text('data')),
        )
      )
    );
  }
}